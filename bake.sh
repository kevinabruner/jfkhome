#!/bin/bash
app_name="jfkhome"
env="$1"        # 'dev' or 'prod'

echo "--- Pulling latest configuration ---"
git pull || { echo "Git pull failed"; return 1; }

echo "--- Searching NetBox for $app_name in $env ---"

# 1. Fetch the data using a single jq call
RESULT=$(ansible-inventory --list | jq -r --arg repo "$app_name" --arg env "$env" '
  ._meta.hostvars | to_entries[] | 
  select(
    .value.custom_fields.repos == $repo and 
    .value.custom_fields.environment == $env and 
    (.value.device_roles | contains(["vm-template"]))
  ) | 
  "\(.key) \(.value.custom_fields.vmid)"
')

# 2. Parse the result
INVENTORY_HOSTNAME=$(echo $RESULT | awk '{print $1}')
VMID=$(echo $RESULT | awk '{print $2}')

if [ "$VMID" == "null" ] || [ -z "$VMID" ]; then
    echo "Error: Could not find VMID for $app_name in inventory."
    exit 1
fi

# 3. Render the metadata sidecar
echo "--- Pre-rendering HAProxy Config for $env ---"

CONFIG_PATH="packer/artifacts/${env}_services_meta.json"
mkdir -p packer/artifacts

ansible-playbook /home/kevin/reverse-proxy/_packer-metadata.yaml -e "env=$env" -K

if [ ! -s "$CONFIG_PATH" ]; then    
    echo "Error: Generated web metadata is empty!"
    exit 1
fi

echo "--- Found VMID: $VMID  ---"

echo "--- Running Pre-flight Checklist ---"
ansible-playbook _packer-preflight.yaml -e "vmid=$VMID" -e "target_app=$app_name" -e "env=$env" -K

echo "--- Baking Gold Image for: $app_name ---"
time packer build \
    -var "target_app=$app_name" \
    -var "proxmox_vmid=$VMID" \
    -var "env=$env" \
    -var "metadata_path=$CONFIG_PATH" \
    -var-file="packer/variables.pkrvars.hcl" \
    -var-file="packer/secret.pkrvars.hcl" \
    packer/golden-image.pkr.hcl
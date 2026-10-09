#!/bin/bash
app_name="jfkhome"
OS_TEMPLATE="truenas-nfs:vztmpl/debian-13-golden.tar.zst"
VMID="9000"
env="$1"        # 'dev' or 'prod'
OUTPUT="jfkhome-${env}-golden"
PLAYBOOK="_packer-build.yaml"
CONFIG_SRC_PATH="packer/artifacts/${env}_services_meta.json"
CONFIG_DEST_PATH="/var/www/html/services_meta.json"

set -euo pipefail

if [[ -z "$env" ]]; then
    echo "Must provide \"dev\" or \"prod\" as arg"
fi

# Clean up old temp VM, if it exists
ssh root@pve "pct status $VMID >/dev/null 2>&1 && pct destroy $VMID --purge --force" || true

# Load and export variables from /etc/environment
#source /etc/environment

echo "--- Doing a git pull because you probably forgot to ---"
git pull || { echo "Git pull failed"; exit 1; }

# Render the DNS list and keepalived config
echo "--- Pre-rendering keepalived config and internal DNS list for $app_name ---"

DNS_PATH="packer/artifacts/${app_name}_custom.conf"
KEEPALIVED_PATH="packer/artifacts/${app_name}_keepalived.conf" 
mkdir -p packer/artifacts

# 3. Render the metadata sidecar
echo "--- Pre-rendering HAProxy Config for $env ---"
mkdir -p packer/artifacts
ansible-playbook /home/kevin/reverse-proxy/_packer-metadata.yaml -e "env=${env}" -K

if [ ! -s "$CONFIG_SRC_PATH" ]; then    
    echo "Error: Generated web metadata is empty!"
    exit 1
fi

echo "--- Baking golden container template for: $app_name ---"
time packer build \
    -var "proxmox_vmid=$VMID" \
    -var "playbook_file"=$PLAYBOOK \
    -var "metadata_source_path=$CONFIG_SRC_PATH" \
    -var "metadata_dest_path=$CONFIG_DEST_PATH" \
    -var "os_template=$OS_TEMPLATE" \
    -var "env=${env}" \
    -var "output_template_name"=$OUTPUT \
    -var-file="packer/variables.pkrvars.hcl" \
    packer/golden-ct.pkr.hcl
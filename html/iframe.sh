#! /bin/bash

/etc/rc.conf_mount_rw

sed -i -e '/header("X-Frame-Options: SAMEORIGIN");/s/^/\/\//' /usr/local/www/guiconfig.inc
sed -i -e "s/\['frame-breaker'\] = true/\['frame-breaker'\] = false/g" /usr/local/www/csrf/csrf-magic.php
sed -i -e '/body{display:none}/s/^/\/\//' /usr/local/www/head.inc
sed -i -e '/top.location = self.location;/s/^/\/\//' /usr/local/www/head.inc

/etc/rc.conf_mount_ro
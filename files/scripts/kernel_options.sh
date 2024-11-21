#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo "Setting default scx sheduler"
sed -i "s/^SCX_SCHEDULER=.*/SCX_SCHEDULER=scx_lavd/" /etc/default/scx

# Setting args for lavd
echo "SCX_FLAGS='--autopilot --autopower'" >> /etc/default/scx

rm -f /usr/share/vulkan/icd.d/lvp_icd.*.json
rm -f /usr/share/vulkan/icd.d/nouveau_icd.*.json

echo "Setting cachyos bore scheduler"
curl -Lo /usr/lib/sysctl.d/99-bore-scheduler.conf https://github.com/CachyOS/CachyOS-Settings/raw/master/usr/lib/sysctl.d/99-bore-scheduler.conf

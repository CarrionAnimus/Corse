#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo 'Enabling system services'

systemctl disable rpm-ostreed-automatic.timer

systemctl enable sddm-boot.service
systemctl enable scx.service
systemctl enable lactd.service

# echo 'Enabling user services'

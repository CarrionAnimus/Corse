#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo 'Enabling Powerlimits for Tesla M40'

# Service
echo '[Unit]
Description=NVIDIA Settings Configuration
After=multi-user.target

[Service]
Type=oneshot
ExecStartPre=/bin/sleep 15
ExecStart=/usr/libexec/nvidia-powerlimit.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/nvidia-powerlimit.service

# Powerlimit
echo '#!/usr/bin/env bash

nvidia-smi -pm 1
nvidia-smi -i 0 -pl 180
nvidia-smi -i 0 -ac 3604,1202' > /usr/libexec/nvidia-powerlimit.sh

# Make executable
chmod +x /usr/libexec/nvidia-powerlimit.sh

echo 'export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json:/usr/share/vulkan/icd.d/intel_icd.i686.json:/usr/share/vulkan/icd.d/nvidia_icd.x86_64.json:/usr/share/vulkan/icd.d/nvidia_icd.i686.json' >> /etc/profile.d/hybrid-graphics.sh
#echo 'export MESA_VK_DEVICE_SELECT=8086:9bc5' >> /etc/profile.d/hybrid-graphics.sh

systemctl enable nvidia-powerlimit.service
systemctl enable sshd

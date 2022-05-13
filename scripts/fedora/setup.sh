#!/bin/bash

user="vagrant"

dnf install podman -y

echo -e "\nEnabling remote rootles containers for user $user..."
su -c "systemctl --user enable --now podman.socket" $user
loginctl enable-linger $user
echo -e "Done!\n"

echo -e "\nTesting remote configuration"

su -c "podman --remote info" $user
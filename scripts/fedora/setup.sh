#!/bin/bash

user="vagrant"

dnf install podman cifs-utils -y

chown -R $user /mnt
su -c "mkdir -p /mnt/c/Users/IEUser" $user
echo "//192.168.56.2/IEUser  /mnt/c/Users/IEUser  cifs  username=IEUser,password=Passw0rd!,rw,uid=1000 0 0" >> /etc/fstab

echo -e "\nEnabling remote rootles containers for user $user..."
su -c "systemctl --user enable --now podman.socket" $user
loginctl enable-linger $user
echo -e "Done!\n"

echo -e "\nTesting remote configuration"

su -c "podman --remote info" $user
#!/bin/bash

export DEBCONF_FRONTEND=noninteractive

# Prepare Debian for boot with CoreOS
apt-get update -y
apt-get upgrade --show-upgraded -y
apt-get install -y linux-image-amd64 git mc
mkdir /boot/grub
apt-get install -y grub-legacy
grub-set-default 1
update-grub

sed -i 's|<token>|'$4'|' $HOME/cloud-config.yaml
sed -i 's|$public_ipv4|'$1'|g' $HOME/cloud-config.yaml
sed -i 's|$private_ipv4|'$2'|g' $HOME/cloud-config.yaml
sed -i 's|$gateway|'$3'|' $HOME/cloud-config.yaml

wget https://raw.githubusercontent.com/coreos/init/master/bin/coreos-install
chmod +x coreos-install
./coreos-install -d /dev/xvdb -C stable -c $HOME/cloud-config.yaml

mkdir /mnt/core-boot
rm -rf /boot/grub
mount /dev/xvdb1 /mnt/core-boot
mv /mnt/core-boot/boot/grub /boot

sed -i 's/hd0/hd1/g' /boot/grub/menu.lst
echo "CoreOS successfully installed."

#!/bin/bash
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda5

mount /dev/sda3 /mnt
mkdir /mnt/home
mount /dev/sda5 /mnt/home

pacstrap /mnt base base-devel vim

genfstab -U -p /mnt >> /mnt/etc/fstab

cp install_archlinux2.sh /mnt/

arch-chroot /mnt /bin/bash

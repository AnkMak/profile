#!/bin/bash
mkfs.ext4 /dev/sda5
mkfs.ext4 /dev/sda6

mount /dev/sda5 /mnt
mkdir /mnt/home
mount /dev/sda6 /mnt/home

pacstrap /mnt base base-devel vim

genfstab -U -p /mnt >> /mnt/etc/fstab

cp install_archlinux2.sh /mnt/

arch-chroot /mnt /bin/bash

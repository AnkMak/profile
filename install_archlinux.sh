#!/bin/bash
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda5

mount /dev/sda3 /mnt
mkdir /mnt/home
mount /dev/sda5 /mnt/home

pacstrap /mnt base base-devel vim

genfstab -U -p /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash

vim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

echo "KEYMAP=us" >> /etc/vconsole.conf
echo "FONT=Lat2-Terminus16" >> /etc/vconsole.conf

echo MyArch > /etc/hostname

pacman -S --noconfirm zd1211-firmware
pacman -S --noconfirm iw wpa_supplicant
pacman -S --noconfirm dialog

passwd

pacman -S --noconfirm grub
grub-install --target=i386-pc --recheck /dev/sda
pacman -S --noconfirm os-prober
grub-mkconfig -o /boot/grub/grub.cfg

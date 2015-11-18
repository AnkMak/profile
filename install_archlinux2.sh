#!/bin/bash
passwd

vim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

echo "KEYMAP=us" >> /etc/vconsole.conf
echo "FONT=Lat2-Terminus16" >> /etc/vconsole.conf

echo MyArch > /etc/hostname

pacman -S --noconfirm zd1211-firmware
pacman -S --noconfirm iw wpa_supplicant
pacman -S --noconfirm dialog


pacman -S --noconfirm grub
grub-install --target=i386-pc --recheck /dev/sda
pacman -S --noconfirm os-prober
grub-mkconfig -o /boot/grub/grub.cfg

exit
#umount -R /mnt

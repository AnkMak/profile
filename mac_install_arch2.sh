#!/bin/bash
#-----check partition-----#
#df -Th

#-----Time Zone-----#
ln -sf /usr/share/zoneinfo/Asia/Macau /etc/localtime

#-----Network Configuration-----#
pacman -S --noconfirm iw wpa_supplicant dialog

#-----Root password-----#
passwd

#-----Should be late-----#
#vim /etc/locale.gen
#locale-gen
#echo LANG=en_US.UTF-8 > /etc/locale.conf

#echo "KEYMAP=us" >> /etc/vconsole.conf
#echo "FONT=Lat2-Terminus16" >> /etc/vconsole.conf

#echo MyArch > /etc/hostname

#pacman -S --noconfirm zd1211-firmware

#-----Boot loader-----#
mkdir /boot/efi
pacman -S --noconfirm grub
pacman -S --noconfirm efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck --debug
cp /boot/efi/EFI/arch_grub/grubx64.efi /boot/backup.efi
mkdir /boot/efi/EFI/BOOT
mount LABEL=EFI /boot/efi
cp /boot/backup.efi /boot/efi/EFI/BOOT/BOOTX64.efi
#pacman -S --noconfirm os-prober
grub-mkconfig -o /boot/grub/grub.cfg

exit
#umount -R /mnt

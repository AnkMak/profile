#!/bin/bash
#-----git-----#
#git clone https://github.com/ankmak/profile

#-----Connect to the internet-----#
#ip lnk
#wifi-menu

#-----Partition the disks-----#
#fdisk -l
#fdisk /dev/nvme0n1
###Please google how to use fdisk command

#-----Format the partitions-----#
mkfs.vfat /dev/nvme0n1p4
mkfs.ext4 /dev/nvme0n1p5
mkfs.ext4 /dev/nvme0n1p6

#-----Mount the file systems-----#
mount /dev/nvme0n1p5 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/nvme0n1p4 /mnt/boot
mount /dev/nvme0n1p6 /mnt/home

#-----Installation-----#
pacstrap /mnt base base-devel vim

#-----Fstab-----#
genfstab -U -p /mnt >> /mnt/etc/fstab

cp mac_install_arch2.sh /mnt/

arch-chroot /mnt /bin/bash

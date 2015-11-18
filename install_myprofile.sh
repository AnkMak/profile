####################### Program #########################
#	This program can customize my arch linux	#
#########################################################

################# History #######################
#	2015/10/5	Ank			#
#################################################

#!/bin/bash
#-------------------add user--------------------#
useradd -m ank
passwd ank
visudo
#---------------- 安裝基本套件 -----------------#
echo '[archlinuxfr]' >> /etc/pacman.conf
echo 'SigLevel = Never' >> /etc/pacman.conf
echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf
pacman -Sy --noconfirm yaourt
pacman -S --noconfirm vim
pacman -S --noconfirm wpa_actiond 				#netctl-auto軟體包
pacman -S --noconfirm alsa-utils				#音效
pacman -S --noconfirm xorg-server xorg-server-utils xorg-xinit	#安裝X
pacman -S --noconfirm mesa
pacman -S --noconfirm xf86-video-vesa				#影像驅動
pacman -S --noconfirm xf86-input-synaptics			#輸入驅動
pacman -S --noconfirm xorg-twm xorg-xclock xterm
pacman -S --noconfirm ttf-dejavu wqy-zenhei			#字型
pacman -S --noconfirm i3
pacman -S --noconfirm firefox
pacman -S --noconfirm openssh
pacman -S --noconfirm tilda					#終端機
pacman -S --noconfirm feh					#圖像查看器
pacman -S --noconfirm zsh
pacman -S --noconfirm git
pacman -S --noconfirm ibus ibus-qt				#倉頡(中文)輸入法
yaourt -S --noconfirm ibus-rime
pacman -S --noconfirm wget
pacman -Syu --noconfirm
#--------------自動連上已知網路-----------------#
systemctl enable netctl-auto@wlp5s0b1.service

#-------------------use Zsh---------------------#
#sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#chsh -s $(which zsh) $(whoami)
git clone git://github.com/robbyrussell/oh-my-zs ~/.oh-my-zsh
cp ~/.zsh ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh) ank
cp -r /root/.oh-my-zsh /home/ank/
chown -R ank:ank /home/ank/.oh-my-zsh

#--------------------Git------------------------#
#git clone https://github.com/AnkMak/profile
cat .vimrc >> /etc/vimrc
cp getty@tty1.service /etc/systemd/system/getty.target.wants/
cp /etc/X11/xinit/xinitrc /etc/X11/xinit/xinitrc_backup
cp ~/profile/.xinitrc /etc/X11/xinit/xinitrc
cp -r ~/profile/.config /home/ank/
chown -R ank:ank /home/ank/.config
cp -r ~/profile/.i3 /home/ank/
chown -R ank:ank /home/ank/.i3
cp -r ~/profile/photo /home/ank/
chown -R ank:ank /home/ank/photo
cp ~/profile/.wallpaper.sh /home/ank/
chown ank:ank /home/ank/.wallpaper.sh
cp ~/profile/.zprofile /home/ank/
chown ank:ank /home/ank/.zprofile
cp ~/profile/.zshrc /home/ank/
chown ank:ank /home/ank/.zshrc

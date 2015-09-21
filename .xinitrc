/home/ank/.wallpaper.sh &
#export LANG=zh_TW.UTF-8
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export XIM=ibus
export XIM_PROGRAM=ibus

ibus-daemon &

#xcompmgr -c &
#devilspie -a &
exec i3 -V >> ~/.i3/i3log 2>&1
#exec i3 --force-xinerama

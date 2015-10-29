xrandr --output LVDS-0 --mode 1366x768
xrandr --output VGA-0 --mode 1440x900
xrandr --output VGA-0 --right-of LVDS-0
/home/ank/.wallpaper.sh &
#export LANG=zh_TW.UTF-8
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export XIM=ibus
export XIM_PROGRAM=ibus

#ibus-daemon &

#xcompmgr -c &
#devilspie -a &
exec i3
#exec i3 --force-xinerama

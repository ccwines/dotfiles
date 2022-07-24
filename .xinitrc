#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

[ -f ~/.xprofile ] && .  ~/.xprofile

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

picom --backend glx &

nitrogen --restore &

xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --primary --mode 2560x1440 --pos 673x1080 --rotate normal --output DP-2 --off
#xrandr --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-2 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --primary --mode 2560x1440 --pos 654x1080 --rotate normal --output DP-2 --off

# xrandr --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --primary --mode 2560x1440 --pos 625x1080 --rotate normal
# xrandr --output HDMI-A-0 --off --output HDMI-A-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --primary --mode 2560x1440 --pos 625x1080 --rotate normal

dunst &

unclutter &

xscreensaver &

# play-with-mpv &

xset s off && xset -dpms

./wacom.sh &

slstatus &

nm-applet &

# gromit-mpx &

exec dwm


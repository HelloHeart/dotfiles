#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
# Show memory use, volume %, battery % and time in status bar
while xsetroot -name "$(date)"
    do
        sleep 1
    done &
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
start-pulseaudio-x11 &
xdg-user-dirs-update &
xmodmap ~/.Xmodmap &
xrdb .Xresources &
compton &
nm-applet & 
volumeicon & 
redshift -t 3500:5500 &
emacs &
workrave &
stalonetray &
feh --bg-scale --no-fehbg ~/Pictures/witch-hat-atelier-chapter-1.jpg &
export _JAVA_AWT_WM_NONREPARENTING=1
#export PATH="/usr/share/icons/breeze/:$PATH"

# debian xfce4

#exec xmonad
while :
do
    ssh-agent dwm
done

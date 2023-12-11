wally ~/Pictures/walls &
xcompmgr &
sxhkd &
slstatus &
nm-applet &
blueman-applet &

setxkbmap -option grp:alt_shift_toggle us,ara &

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec dwm

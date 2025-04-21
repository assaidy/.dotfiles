dunst &
sxhkd &
picom &
nm-applet &
blueman-applet &
setxkbmap -option grp:alt_shift_toggle us,ara
sct 5000 &
$HOME/.config/polybar/start.sh &

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

exec i3


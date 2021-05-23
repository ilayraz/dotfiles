#
# ~/.zprofile
#

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx "~/.config/X11/xinitrc" &> /dev/null
fi

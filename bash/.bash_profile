#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# autostart systemd default session on tty1
if [[ "$(tty)" == '/dev/tty1' ]]; then
	exec startx
fi

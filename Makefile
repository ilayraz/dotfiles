default: install-packages link-config

install-packages:
	sudo pacman -Sy yaourt
	yaourt -S --needed --noconfirm `cat packages.txt`

link-config:
	stow --restow `ls -d */`

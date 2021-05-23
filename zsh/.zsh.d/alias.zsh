# Aliases
alias ls='ls --color=auto'
alias ll='ls -lha'
alias rg='rg --smart-case --follow'
alias tree='tree -C'
alias ytop='ytop -p'
alias mus='ncmpcpp'
alias cp='cp --reflink=auto --sparse=always'
alias mpc="mpc -h '${MDPASS}@localhost'"
alias mpf='mpc -h "${MPDPASS}@localhost" -f "[[%artist% - ]%title%][ - %genre%] #|[%file%]" listall | fzf -m --print0 | cut -d"|" -f2 -s -z | xargs -rox0 -n 1 -- mpc  -h "${MPDPASS}@localhost" insert'
alias valful='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind.log'
alias mbsync='mbsync -c ~/.config/mbsync/.mbsync'
alias i3lock='i3lock -B 10 -k --pass-media-keys --composite --timecolor 00ffffff --datecolor 00ffffff'
alias watch="watch "
alias pf="ps aux | rg"
alias gis="git status"
alias irssi='irssi --config="${XDG_CONFIG_HOME}/irssi/config" --home="${XDG_DATA_HOME}/irssi"'
alias reboot-bios="systemctl reboot --firmware-setup"
alias firejail="firejail --rmenv=LS_COLORS"

# fasd alias
alias a='fasd -a'
alias s='fasd -si'
alias d='fasd -d'
alias f='fasd -f'
alias z='fasd_cd -d'
alias e='f -e ~/.emacs.d/bin/ec'
alias evf='f -e evince'

# Until djvulibre is fixed
alias evince="qemu-x86_64 /usr/bin/evince"

# Exports

export EDITOR=et
export SUDOEDITOR=et
export DEFAULT_USER='ilayraz'
export TERM=rxvt-unicode-256color
export npm_config_prefix=~/.node_modules
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
export _FASD_DATA="${XDG_CONFIG_HOME}/fasd/data"
export WORDLIST="${XDG_CONFIG_HOME}/hunspell/personal_dictionary"
export LESSHISTFILE="${XDG_CACHE_HOME}/less/history"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export TEXMFHOME="${XDG_DATA_HOME}/texmf"
MPDPASS='ZQPF84fj%*?dsSEz'

export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/Desktop"

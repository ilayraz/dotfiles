# Aliases
alias ls='ls --color=auto'
alias ll='ls -lha'
alias rg='rg --smart-case --follow'
alias tree='tree -C'
alias ytop='ytop -p'
alias ec="~/.emacs.d/bin/ec"
alias et="~/.emacs.d/bin/et"
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
export EDITOR=~/.emacs.d/bin/et
export SUDOEDITOR=~/.emacs.d/bin/et
export DEFAULT_USER='ilayraz'
export TERM=rxvt-unicode-256color
export npm_config_prefix=~/.node_modules
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export XDG_CONFIG_HOME="$HOME/.config"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"
MPDPASS='ZQPF84fj%*?dsSEz'

export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/.node_modules/bin"
export PATH="${PATH}:/opt/anaconda/bin"
export PATH="${PATH}:${HOME}/Desktop"

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

archey3

alias ls='ls --color=auto'
alias ll='ls -la'
PS1='[\u@\h \W]\$ '

export PATH=~/bin:$PATH

export EDITOR=~/.emacs.d/bin/et
export TERMINAL=sakura

# JAVA
export ANDROID_HOME=/opt/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# Emacs
alias ec=~/.emacs.d/bin/ec
alias et=~/.emacs.d/bin/et

# NPM
export PATH=~/.npm-global/bin:$PATH

# Conda
. /usr/etc/profile.d/conda.sh

# Wine
export WINEPREFIX="/home/ilayraz/.steam/steam/steamapps/common/Proton 3.7/dist/share/default_pfx/"
export WINEPATH="/home/ilayraz/.steam/steam/steamapps/common/Proton 3.7/dist/bin/wine64"

# Ruby
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

# Aliases
alias rg="rg --smart-case --follow"
alias tree="tree -C"

# Utilities

# SYNOPSIS
#   manopt command opt
#
# DESCRIPTION
#   Returns the portion of COMMAND's man page describing option OPT.
#   Note: Result is plain text - formatting is lost.
#
#   OPT may be a short option (e.g., -F) or long option (e.g., --fixed-strings);
#   specifying the preceding '-' or '--' is OPTIONAL - UNLESS with long option
#   names preceded only by *1* '-', such as the actions for the `find` command.
#
#   Matching is exact by default; to turn on prefix matching for long options,
#   quote the prefix and append '.*', e.g.: `manopt find '-exec.*'` finds
#   both '-exec' and 'execdir'.
#
# EXAMPLES
#   manopt ls l           # same as: manopt ls -l
#   manopt sort reverse   # same as: manopt sort --reverse
#   manopt find -print    # MUST prefix with '-' here.
#   manopt find '-exec.*' # find options *starting* with '-exec'
manopt() {
  local cmd=$1 opt=$2
  [[ $opt == -* ]] || { (( ${#opt} == 1 )) && opt="-$opt" || opt="--$opt"; }
  man "$cmd" | col -b | awk -v opt="$opt" -v RS= '$0 ~ "(^|,)[[:blank:]]+" opt "([[:punct:][:space:]]|$)"'
}

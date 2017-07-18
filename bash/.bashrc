#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
PS1='[\u@\h \W]\$ '

export EDITOR=~/.emacs.d/bin/et
export TERMINAL=sakura

export ANDROID_HOME=/opt/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

alias ec=~/.emacs.d/bin/ec
alias et=~/.emacs.d/bin/et

# python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh

# NPM
export PATH=~/.npm-global/bin:$PATH

archey3

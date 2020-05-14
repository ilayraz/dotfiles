export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=120000
export SAVEHIST=100000

setopt NO_LIST_BEEP
setopt EXTENDED_HISTORY # Save timestamp and duration
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS # Don't enter command into history if duplicate of previous command
setopt HIST_VERIFY # Enter the command into prompt before running from history
setopt HIST_IGNORE_SPACE # Don't input command with leading space into history
setopt SHARE_HISTORY # Share history between shell instances
setopt LONG_LIST_JOBS # Show details when suspending jobs
setopt NOTIFY # Report the status of backgrounds jobs immediately
setopt NO_SH_WORD_SPLIT # Don't split field on expanded params

# Case insensitive matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Function for batch move/copy
autoload -Uz zmv

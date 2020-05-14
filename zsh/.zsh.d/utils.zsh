manopt() {
  local cmd=$1 opt=$2
  [[ $opt == -* ]] || { (( ${#opt} == 1 )) && opt="-$opt" || opt="--$opt"; }
  man "$cmd" | col -b | awk -v opt="$opt" -v RS= '$0 ~ "(^|,)[[:blank:]]+" opt "([[:punct:][:space:]]|$)"'
}

ifind() {
    local term=$1
    find . -iname "*${term}*"
}

# Open in evince and close console
ev() {
    local name=$1
    evince "$1"&|; exit
}

# Pick processes to kill using fzf
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Background job when pressing ctrl+Z on empty prompt
# Disown job if pressed again
ctrl-z-bg-disown() {
    if [[ $#BUFFER -eq 0 ]]; then
        if (($ctrl_z_already_bg)); then
            local jobid=$(jobs | tail | rg --only-matching '^\[(\d+)\]' --replace '$1')
            if (($jobid)); then
                disown "%${jobid}"
                echo "[${jobid}]    $! Disowned"
                ctrl_z_already_bg=0
            else
                echo "No job to disown!"
            fi
        else
            bg
            ctrl_z_already_bg=1
        fi
        zle redisplay
    else
        zle push-input
    fi
}
ctrl_z_bg_disown_precmd() {
    ctrl_z_already_bg=0
}
zle -N ctrl-z-bg-disown
bindkey '' ctrl-z-bg-disown
precmd_functions+=ctrl_z_bg_disown_precmd

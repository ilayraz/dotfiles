export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZHOME="${ZINIT_HOME:-${HOME}}/.zsh.d"
ZBIN="${ZHOME}/bin"

# $1,... - script to be compiled
compile_or_recompile() {
    local file
    for file in "$@"; do
        if [[ -f $file ]] && [[ ! -f ${file}.zwc ]] \
               || [[ $file -nt ${file}.zwc ]]; then
            zcompile "$file"
        fi
    done
}

# External files

compile_or_recompile "${HOME}/.zshrc" "${ZHOME}/alias.zsh" "${ZHOME}/opts.zsh" \
                     "${ZHOME}/utils.zsh"
source "${ZHOME}/opts.zsh"
source "${ZHOME}/utils.zsh"
source "${ZHOME}/alias.zsh"

# zinit
if [[ ! -d ${ZBIN} ]]; then
    print 'Installing zinit...'
    mkdir -p "${ZHOME}"
    git clone https://github.com/zdharma/zinit.git "${ZBIN}"
    compile_or_recompile "${ZBIN}/zinit.zsh"
fi

typeset -A ZINIT
ZINIT[HOME_DIR]="$ZHOME"
ZINIT[ZCOMPDUMP_PATH]="${ZHOME}/.zcompdump"

source "${ZBIN}/zinit.zsh"

# Packages
# Themes

fasd_cache_file="${ZBIN}/fasd_cache.zsh"
if [[ "${commands[fasd]}" -nt "$fasd_cache_file" || ! -s "$fasd_cache_file" ]]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install \
         zsh-wcomp zsh-wcomp-install \
         >"$fasd_cache_file" 2>/dev/null;
    compile_or_recompile "$fasd_cache_file"
fi
source "$fasd_cache_file"

zinit ice depth'1' atload'!compile_or_recompile recsource "${XDG_DATA_HOME}/p10k/p10k.zsh"; source "${XDG_DATA_HOME}/p10k/p10k.zsh"'
zinit light romkatv/powerlevel10k

zinit ice lucid atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit ice lucid depth'1' light-mode trigger-load'!man'
zinit snippet OMZP::colored-man-pages

# zinit ice lucid trigger-load'!conda'
# zinit snippet "${ZHOME}/my_plugins/conda.zsh"

# fzf config
zinit ice lucid wait if'[[ -f "/usr/share/fzf/key-bindings.zsh" ]]'
zinit snippet "/usr/share/fzf/key-bindings.zsh"

zinit wait lucid depth'1' light-mode for \
      atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
          zdharma/fast-syntax-highlighting \
      blockfe \
          zsh-users/zsh-completions \
      atload'!_zsh_autosuggest_start' \
          zsh-users/zsh-autosuggestions

# Completions
autoload -Uz compinit
compinit -u -d "${HOME}/.zcompdump"

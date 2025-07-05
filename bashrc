#!/bin/bash

# shellcheck disable=SC1090,SC1091

# Enable 'hash' command to find executables
set -h

# Add PATH entries without duplicates
add_path() {
    if [[ ":$PATH:" == *":$1:"* ]]; then
        # Remove existing entry, ensuring it will be added to the front
        PATH=$(echo "$PATH" | sed -e "s|:$1:|:|g" -e "s|^$1:||" -e "s|:$1$||")
    fi
    export PATH="$1:$PATH"
}

if [ "$(uname -s)" == "Darwin" ]; then
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi

HOMEBREW_BIN="/usr/local/bin/brew"
if [ "$(uname -m)" == "arm64" ]; then
  HOMEBREW_BIN="/opt/homebrew/bin/brew"
fi

if [ -x $HOMEBREW_BIN ]; then
  eval "$($HOMEBREW_BIN shellenv)"
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/coreutils/libexec/" ]]; then
    add_path "${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin"
    export MANPATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"
fi

if [[ -d "/nix" ]]; then
    add_path "/nix/var/nix/profiles/default/bin"
    add_path "${HOME}/.nix-profile/bin"
fi

alias df='df -h'
alias du='du -sh'
alias free='free -m'
alias git-sh='source $HOME/.bash-git-prompt/gitprompt.sh'
alias grep='grep --color=auto'
alias la='ls --color=auto -lha'
alias ll='ls --color=auto -lh'
alias ls='ls --color=auto'
alias scpi='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sshi='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias tree="tree -I 'node_modules|vendor'"
alias xclip='xclip -sel clip'

for bc in \
    "/etc/bash_completion" \
    "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" \
    "${HOME}/.nix-profile/etc/profile.d/bash_completion.sh" \
    ; do
    if [[ -f "$bc" ]]; then
        . "$bc"
        break
    fi
done

eval "$(dircolors)"

if hash vim 2> /dev/null; then
    EDITOR=$(command -v vim)
    export EDITOR
fi

if [[ -f /etc/redhat-release ]]; then
    PS1_SEP=" "
else
    PS1_SEP=":"
fi

# Prompt colors
BLUE='\[\e[94;1m\]'
CLEAR='\[\e[0m\]'
CYAN='\[\e[96;1m\]'
RED='\[\e[91;1m\]'
WHITE='\[\e[97;1m\]'

export PS1="[${RED}\\u${CYAN}@${BLUE}\\h${CLEAR}${PS1_SEP}${WHITE}\\w${CLEAR}]\\$ "

# Short prompt for presentations:
function short_prompt {
    export PS1="${WHITE}\\$ $CLEAR"
}

if [[ -f "$HOME/.no_history" ]]; then
    unset HISTFILE
else
    export HISTCONTROL="ignoreboth:erasedups"
    export HISTSIZE=10000
fi

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Custom applications

export BAT_THEME="Monokai Extended"

LOCALE_FOLDER="${HOME}/.nix-profile/lib/locale"
if [[ -d "$LOCALE_FOLDER" ]]; then
  export LOCALE_ARCHIVE="${LOCALE_FOLDER}/locale-archive"
fi

if [[ -x "$HOME/.local/bin/mise" ]]; then
    eval "$("$HOME/.local/bin/mise" activate --shims bash)"
fi

# Fix SSH_AUTH_SOCK for screen sessions
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -fs "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh_auth_sock"
fi
export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"

case "$TERM" in
    screen*)
        export TERM="screen-256color"
    ;;
    xterm*)
        export TERM="xterm-256color"
    ;;
esac

# Vi mode for interactive terminal:
if [[ $- == *i* ]]; then
    bind -m vi-insert '\C-l':clear-screen
    set -o vi
fi

# fzf should be configured after vi mode:
if [[ -f "$HOME/.fzf.bash" ]]; then
    source "$HOME/.fzf.bash"
    if hash ag 2> /dev/null; then
        export FZF_DEFAULT_COMMAND='ag -g ""'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi
    export FZF_DEFAULT_OPTS="--height 100%"
    export FZF_CTRL_T_OPTS="--preview 'head -100 {}'"
fi

# User-specific executables should be the first in $PATH:
add_path "${HOME}/.local/bin"

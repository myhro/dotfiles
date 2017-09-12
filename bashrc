if $(hash brew 2> /dev/null); then
    BREW_PREFIX="$(brew --prefix)"
else
    BREW_PREFIX=""
fi

if [[ -d "${BREW_PREFIX}/opt/coreutils/libexec/" ]]; then
    export PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="${BREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"
fi

alias df='df -h'
alias du='du -sh'
alias free='free -m'
alias grep='grep --color=auto'
alias la='ls --color=auto -lha'
alias ll='ls --color=auto -lh'
alias ls='ls --color=auto'
alias scpi='scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias sshi='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias xclip='xclip -sel clip'

for bc in "/etc/bash_completion" "${BREW_PREFIX}/etc/bash_completion"; do
    if [[ -f $bc ]]; then
        . $bc
        break
    fi
done

eval "$(dircolors)"

if [[ -f /etc/redhat-release ]]; then
    PS1_SEP=" "
else
    PS1_SEP=":"
fi
export PS1="[\[\e[01;31m\]\u\[\e[01;36m\]@\[\e[01;34m\]\h\[\e[m\]${PS1_SEP}\[\e[01;37m\]\w\[\e[m\]]\$ "

if [[ -f "$HOME/.no_history" ]]; then
    unset HISTFILE
else
    export HISTCONTROL="ignoreboth:erasedups"
    export HISTSIZE=10000
fi

export LANG="en_US.UTF-8"

# Short prompt for presentations:
function short_prompt {
    export PS1='\e[01;37m\]\$\e[m\] '
}

if [[ -d "$HOME/.rbenv" ]]; then
    eval "$(rbenv init -)"
fi

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
    bind -m vi-insert "\C-l":clear-screen
    set -o vi
fi

# macOS Virtualenvwrapper:
VENVWRAPPER="/usr/local/bin/virtualenvwrapper.sh"
if [[ -f $VENVWRAPPER ]]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
    source $VENVWRAPPER
fi

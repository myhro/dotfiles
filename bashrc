# Prefixo do Homebrew
if $(hash brew 2> /dev/null); then
    BREW_PREFIX="$(brew --prefix)"
else
    BREW_PREFIX=""
fi

# coreutils do Homebrew
if [[ -d "${BREW_PREFIX}/opt/coreutils/libexec/" ]]; then
    export PATH="${BREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="${BREW_PREFIX}/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# Atalhos:
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

# Bash completion:
for bc in "/etc/bash_completion" "${BREW_PREFIX}/etc/bash_completion"; do
    if [[ -f $bc ]]; then
        . $bc
        break
    fi
done

# Cores dos diretórios e arquivos:
eval "$(dircolors)"

# Customização do prompt:
export PS1='[\[\e[01;31m\]\u\[\e[01;36m\]@\[\e[01;34m\]\h\[\e[m\]:\[\e[01;37m\]\w\[\e[m\]]\$ '

if [[ -f "$HOME/.no_history" ]]; then
    # Desabilita o histórico:
    unset HISTFILE
else
    # Ou ignora entradas duplicadas, aumentando seu tamanho:
    export HISTCONTROL="ignoreboth:erasedups"
    export HISTSIZE=10000
fi

# Go:
if [[ -d "$HOME/.go" ]]; then
    export GOROOT="$HOME/.go"
    export GOPATH="$GOROOT/gopath"
    export PATH="$PATH:$GOROOT/bin"
fi

# Google Cloud SDK:
GCLOUD_SDK="$HOME/.bin/google-cloud-sdk"
if [[ -d $GCLOUD_SDK ]]; then
    source "$GCLOUD_SDK/path.bash.inc"
    source "$GCLOUD_SDK/completion.bash.inc"
fi

# Heroku:
[[ -d "$HOME/.heroku" ]] && PATH="$PATH:$HOME/.heroku/bin"

# Lida corretamente com acentos:
export LANG="en_US.UTF-8"

# Prompt resumido, para fins de demonstração:
function short_prompt {
    export PS1='\e[01;37m\]\$\e[m\] '
}

# rbenv:
if [[ -d "$HOME/.rbenv" ]]; then
    eval "$(rbenv init -)"
fi

# Suporte a 256 cores:
case "$TERM" in
    screen*)
        export TERM="screen-256color"
    ;;
    xterm*)
        export TERM="xterm-256color"
    ;;
esac

# Vi mode, se o terminal for interativo:
if [[ $- == *i* ]]; then
    bind -m vi-insert "\C-l":clear-screen
    set -o vi
fi

# Virtualenvwrapper:

VENVWRAPPER="/usr/local/bin/virtualenvwrapper.sh"
if [[ -f $VENVWRAPPER ]]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
    source $VENVWRAPPER
fi

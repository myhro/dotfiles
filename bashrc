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

# Cores dos diretórios e arquivos:
eval `dircolors`

# Customização do prompt:
export PS1='[\[\e[01;31m\]\u\[\e[01;36m\]@\[\e[01;34m\]\h\[\e[m\]:\[\e[01;37m\]\w\[\e[m\]]\$ '

# Bash completion:
[[ -f "/etc/bash_completion" ]] && source "/etc/bash_completion"

# Autoenv:
[[ -f "$HOME/.autoenv/activate.sh" ]] && source "$HOME/.autoenv/activate.sh"

# Google Cloud SDK:
GCLOUD_SDK="$HOME/.bin/google-cloud-sdk"
if [[ -d $GCLOUD_SDK ]]; then
    source $GCLOUD_SDK/path.bash.inc
    source $GCLOUD_SDK/completion.bash.inc
fi

# Heroku:
[[ -d "$HOME/.heroku" ]] && PATH=$PATH:$HOME/.heroku/bin

# rbenv:
if [[ -d "$HOME/.rbenv" ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Configurações do terminal interativo:
case "$TERM" in
    xterm*)
        # 256 Cores:
        export TERM=xterm-256color
        # Permite usar CTRL+S sem bloquear o terminal:
        stty -ixon
        ;;
esac

# Lida corretamente com acentos:
export LANG=en_US.UTF-8

# Desabilita o histórico:
unset HISTFILE

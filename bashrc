# Atalhos:
alias df='df -h'
alias du='du -sh'
alias free='free -m'
alias grep='grep --color=auto'
alias la='ls --color=auto -lha'
alias ll='ls --color=auto -lh'
alias ls='ls --color=auto'
alias sshi='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Bash completion:
[[ -f "/etc/bash_completion" ]] && source "/etc/bash_completion"

# Funções ZZ:
[[ -f "$HOME/.zz/funcoeszz" ]] && source "$HOME/.zz/funcoeszz"

# Instalações locais:
[[ -d "$HOME/.local/bin" ]] && PATH=$PATH:$HOME/.local/bin

# RVM:
[[ -d "$HOME/.rvm" ]] && PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Configurações do terminal interativo:
case "$TERM" in
    xterm*)
        # 256 Cores:
        TERM=xterm-256color
        # Permite usar CTRL+S sem bloquear o terminal:
        stty -ixon
        ;;
esac

# Customização do prompt:
export PS1='[\[\e[01;31m\]\u\[\e[01;36m\]@\[\e[01;34m\]\h\[\e[m\]:\[\e[01;37m\]\w\[\e[m\]]\$ '

# Lida corretamente com acentos:
export LANG=en_US.UTF-8

# Desabilita o histórico:
unset HISTFILE

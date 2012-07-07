# Atalhos:
alias df='df -h'
alias free='free -m'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Bash completion:
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Lida corretamente com acentos:
export LANG=en_US.UTF-8

# Desabilita o histórico:
unset HISTFILE

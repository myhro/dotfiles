# Atalhos:
alias df='df -h'
alias free='free -m'
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Bash completion:
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Customização do prompt:
export PS1="[\[\e[01;31m\]\u\[\e[01;36m\]@\[\e[01;34m\]\h\[\e[m\]:\[\e[01;37m\]\w\[\e[m\]]\$ "

# Lida corretamente com acentos:
export LANG=en_US.UTF-8

# Desabilita o histórico:
unset HISTFILE

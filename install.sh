#!/bin/bash

set -eu

DIR="$HOME/.dotfiles"

if [ -d "$DIR" ]; then
    for f in bashrc gemrc screenrc vimrc; do
        ln -fs "$DIR/$f" "$HOME/.$f"
    done
    ln -fs ~/.bashrc ~/.profile
    [ "$(uname -s)" = "Darwin" ] && ln -fs "$DIR/tmux.conf" "$HOME/.tmux.conf"
    if [ "${1:-}" = "plug" ]; then
        mkdir -p ~/.vim/
        curl -o ~/.vim/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
fi

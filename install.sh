#!/bin/bash

if [ -d .dotfiles ]; then
    for f in bashrc gemrc screenrc vimrc; do
        ln -fs .dotfiles/$f ~/.$f
    done
    ln -fs ~/.bashrc ~/.profile
    [ "$(uname -s)" = "Darwin" ] && ln -fs .dotfiles/tmux.conf .tmux.conf
    if [ "$1" = "plug" ]; then
        mkdir -p ~/.vim/
        curl -o ~/.vim/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
fi

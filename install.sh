#!/bin/sh

if [ -d .dotfiles ]; then
    for f in bashrc gemrc screenrc vimrc; do
        ln -fs .dotfiles/$f ~/.$f
    done
    ln -fs ~/.bashrc ~/.profile
    [ "$(uname -s)" = "Darwin" ] && ln -fs .dotfiles/tmux.conf .tmux.conf
    if [ "$1" = "vundle" ]; then
        mkdir -p ~/.vim/bundle/Vundle.vim
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
fi

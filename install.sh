#!/bin/sh

if [ -d .dotfiles ]; then
    for f in bashrc gemrc screenrc tmux.conf vimrc; do
        ln -fs .dotfiles/$f ~/.$f
    done
    ln -fs ~/.bashrc ~/.profile
    if [ "$1" = "vundle" ]; then
        mkdir -p ~/.vim/bundle/Vundle.vim
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
fi

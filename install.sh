#!/bin/sh

if [ -d .dotfiles ]; then
    ln -fs .dotfiles/bashrc ~/.bashrc
    ln -fs .dotfiles/screenrc ~/.screenrc
    ln -fs .dotfiles/vimrc ~/.vimrc
    ln -fs ~/.bashrc ~/.profile
    if [ "$1" = "vundle" ]; then
        mkdir -p ~/.vim/bundle/Vundle.vim
        git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
    fi
fi

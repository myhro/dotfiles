#!/bin/sh

if [ -d .dotfiles ]; then
    ln -fs .dotfiles/bashrc ~/.bashrc
    ln -fs .dotfiles/screenrc ~/.screenrc
    ln -fs .dotfiles/vimrc ~/.vimrc
    ln -fs ~/.bashrc ~/.profile
fi

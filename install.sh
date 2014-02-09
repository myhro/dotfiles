#!/bin/sh

if [ -d .dotfiles ]; then
    ln -fs .dotfiles/bashrc ~/.bashrc
    ln -fs .dotfiles/screenrc ~/.screenrc
    ln -fs .dotfiles/vimrc ~/.vimrc
    ln -fs ~/.bashrc ~/.profile
    if [ "$1" = "pathogen" ]; then
        mkdir -p ~/.vim/autostart
        mkdir ~/.vim/bundle
        wget -q -O ~/.vim/autostart/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    fi
fi

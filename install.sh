#!/bin/sh

if [ -d .dotfiles ]; then
    ln -fs .dotfiles/bashrc ~/.bashrc
    ln -fs .dotfiles/screenrc ~/.screenrc
    ln -fs .dotfiles/vimrc ~/.vimrc
    ln -fs ~/.bashrc ~/.profile
    if [ "$1" = "pathogen" ]; then
        mkdir -p ~/.vim/autoload
        mkdir ~/.vim/bundle
        wget -q -O ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    fi
fi

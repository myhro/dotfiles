dotfiles
========

This repository serves as a central point to store configuration files to make the daily terminal usage more comfortable. In order to use them, clone this repository and link the desired files to your home folder.

## Usage

Cloning the repository on the `~/.dotfiles` directory:

    git clone https://github.com/myhro/dotfiles.git ~/.dotfiles

Installing each configuration file individually:

    ln -s .dotfiles/bashrc ~/.bashrc
    ln -s ~/.bashrc ~/.profile
    ln -s .dotfiles/screenrc ~/.screenrc
    ln -s .dotfiles/vimrc ~/.vimrc

Installing everything:

    bash .dotfiles/install.sh [vundle]

The optional parameter `vundle` installs [Vundle](https://github.com/VundleVim/Vundle.vim), a Vim plugin manager. The plugins listed on `~/.vimrc` can then be installed using `:PluginInstall` under Vim.

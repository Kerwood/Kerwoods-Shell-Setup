#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2)
LBLUE=$(tput setaf 6)
RED=$(tput setaf 1)
PURPLE=$(tput setaf 5)


echo "${GREEN} [+] Configuring Vim${NORMAL}"

mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
echo "syntax enable" >> ~/.vimrc
echo "colorscheme monokai" >> ~/.vimrc
echo "set number" >> ~/.vimrc


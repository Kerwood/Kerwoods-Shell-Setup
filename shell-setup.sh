#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2)
LBLUE=$(tput setaf 6)
RED=$(tput setaf 1)
PURPLE=$(tput setaf 5)

echo "${GREEN} [+] Updating apt-get${NORMAL}"
apt-get update > /dev/null 2>&1

echo "${GREEN} [+] Installing git, zsh, tmux, vim, curl${NORMAL}"
apt-get install git zsh tmux vim curl > /dev/null 2>&1

echo "${GREEN} [+] Configuring tmux${NORMAL}"
curl -o ~/.tmux.conf https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Tmux/.tmux.conf > /dev/null 2>&1

cat ~/.bashrc << EOF
if [[ $(echo $TTY | cut -d \/ -f 4) = '0' ]]; then                                                                                                                                                                                
        tmux -2 a || tmux -2                                                                                                                                                                                                      
fi
EOF

sudo apt-get install cmake g++ > /dev/null 2>&1
git clone https://github.com/thewtex/tmux-mem-cpu-load.git > /dev/null 2>&1
cd tmux-mem-cpu-load
cmake . > /dev/null 2>&1
make > /dev/null 2>&1
make install > /dev/null 2>&1



echo "${GREEN} [+] Configuring Vim${NORMAL}"
echo
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Vim/monokai.vim > /dev/null 2>&1
curl -o ~/.vimrc https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Vim/.vimrc > /dev/null 2>&1


echo "${GREEN} [+] Installing Oh My Zsh${NORMAL}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/.oh-my-zsh/themes
curl -o ~/.oh-my-zsh/themes/kerwood.zsh-theme https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Oh-my-zsh/kerwood.zsh-theme > /dev/null 2>&1
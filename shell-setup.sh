#!/bin/bash
set -e
clear
echo
echo "Kerwood's Shell Setup"
echo

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2)
LBLUE=$(tput setaf 6)
RED=$(tput setaf 1)
PURPLE=$(tput setaf 5)


echo "${GREEN} [+] Updating apt-get${NORMAL}"
sudo apt-get update > /dev/null


echo "${GREEN} [+] Installing git, zsh, tmux, vim, cmake${NORMAL}"
sudo apt-get -y install git zsh tmux vim cmake > /dev/null


echo "${GREEN} [+] Downloading tmux.conf${NORMAL}"
curl -o ~/.tmux.conf https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Tmux/.tmux.conf > /dev/null 2>&1

echo "${GREEN} [+] Installing Vim Docker Syntax${NORMAL}"
git clone https://github.com/ekalinin/Dockerfile.vim.git
cd Dockerfile.vim
make install
cd ..
rm -rvf Dockerfile.vim

echo "${GREEN} [+] Installing tmux-mem-cpu-load${NORMAL}"

sudo apt-get -y install cmake g++ > /dev/null
git clone -q https://github.com/thewtex/tmux-mem-cpu-load.git
cd tmux-mem-cpu-load
cmake . > /dev/null
make > /dev/null
sudo make install > /dev/null
cd ..
rm -rf tmux-mem-cpu-load > /dev/null



echo "${GREEN} [+] Downloading Vim configuraiton files${NORMAL}"
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Vim/monokai.vim > /dev/null 2>&1
curl -o ~/.vimrc https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Vim/.vimrc > /dev/null 2>&1


echo "${GREEN} [+] Installing Oh My Zsh${NORMAL}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -o ~/.oh-my-zsh/themes/kerwood.zsh-theme https://raw.githubusercontent.com/Kerwood/Kerwoods-Shell-Setup/master/Oh-my-zsh/kerwood.zsh-theme > /dev/null 2>&1
sed -i -e "s/robbyrussell/kerwood/g" ~/.zshrc



echo
echo "${GREEN} [+] Enableing tmux auto start${NORMAL}"
cat >> ~/.zshrc << \EOF

# Start Tmux at login
if [[ $(echo $TTY | cut -d \/ -f 4) = '0' ]]; then
	tmux -2 a || tmux -2
fi
EOF


echo
echo "${GREEN} [+] Done!..${NORMAL}"

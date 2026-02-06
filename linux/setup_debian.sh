#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: sudo ./setup.sh <username>"
	exit 0
else
	username=$1
	folder="/home/$1"
	echo Installation will be done on the home directory $folder.
fi


echo "Starting setup script..."
echo -e "\n -----------------------------------------------"

echo -e "\n Updating..."
# update and upgrade
apt update
echo -e "\n -----------------------------------------------"

echo -e "\n Upgrading..."
apt upgrade -y
echo -e "\n -----------------------------------------------"

echo -e "\n Installing Dependecies..."
# install dependencies
yes | apt install btop
yes | apt install neofetch
yes | apt install zsh 
yes | apt install lazydocker
yes | apt install zoxide

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

echo -e "\n -----------------------------------------------"

touch $PWD/local_configs.sh

echo -e "\n Creating symbolic links\n"

mv $folder/.bashrc $folder/.bashrc.bk
mv /root/.bashrc /root/.bashrc.bk

ln -s $PWD/zsh/zshrc $folder/.zshrc
ln -s $PWD/bash/bashrc $folder/.bashrc
ln -s $PWD/../vimrc $folder/.vimrc
ln -s $PWD/../gitconfig $folder/.gitconfig
ln -s $PWD/../nvim $folder/.config/nvim
# add settings to superuser too
ln -s $PWD/root/.dotfiles
ln -s $PWD/zsh/zshrc /root/.zshrc
ln -s $PWD/bash/bashrc /root/.bashrc
ln -s $PWD/../vimrc /root/.vimrc

chown -R $username:$username $folder

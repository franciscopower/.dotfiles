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
yes | apt install python3
yes | apt install python3-pip
yes | apt install ranger
yes | apt install neovim
yes | apt install vim
yes | apt install htop 
yes | apt install neofetch  
yes | apt install zsh 

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo -e "\n -----------------------------------------------"

touch $PWD/local_configs.sh

echo -e "\n Creating symbolic links\n"

mv $folder/.bashrc $folder/.bashrc.bk
mv /root/.bashrc /root/.bashrc.bk

ln -s $PWD/zshrc $folder/.zshrc
ln -s $PWD/bashrc $folder/.bashrc
ln -s $PWD/vimrc $folder/.vimrc
ln -s $PWD/gitconfig $folder/.gitconfig
ln -s $PWD/nvim $folder/.config/nvim
ln -s $PWD/zshrc /root/.zshrc
ln -s $PWD/bashrc /root/.bashrc
ln -s $PWD /root/.dotfiles

chown -R $username:$username $folder

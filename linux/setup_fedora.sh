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

# install dependencies
yes | dnf install neovim
yes | dnf install htop
yes | dnf install neofetch
yes | dnf install zsh

echo -e "\n -----------------------------------------------"

touch $PWD/local_configs.sh

echo -e "\n Creating symbolic links\n"

mv $folder/.bashrc $folder/.bashrc.bk
mv /root/.bashrc /root/.bashrc.bk

ln -s $PWD/zsh/zshrc $folder/.zshrc
ln -s $PWD/bash/bashrc $folder/.bashrc
ln -s $PWD/../vimrc $folder/.vimrc
ln -s $PWD/gitconfig $folder/.gitconfig
ln -s $PWD/../nvim $folder/.config/nvim
# add settings to superuser too
ln -s $PWD /root/.dotfiles
ln -s $PWD/zsh/zshrc /root/.zshrc
ln -s $PWD/bash/bashrc /root/.bashrc
ln -s $PWD/../vimrc /root/.vimrc

chown -R $username:$username $folder

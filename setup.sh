#!/bin/bash

if [ "$HOME/.dotfiles" != "$PWD" ]
then 
	echo "Setup script cannot be run." 
	echo "To run the scrip, mas sure the current directory is $HOME/.dotfiles"
	echo "To do so, place the .dotfiles directory in the $HOME directory and run the setup script from inside the .dotfiles directory."
	exit 1
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
yes | apt install vim
yes | apt install htop 
yes | apt install neofetch  
yes | apt install zsh 
echo -e "\n -----------------------------------------------"

echo -e "\n Creating symbolic links\n"
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.gitconfig $HOME/.gitconfig
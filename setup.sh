#!/bin/bash

echo "Starting setup script..."

# update and upgrade
apt update
apt upgrade -y

# install dependencies
yes | apt install vim
yes | apt install htop 
yes | apt install neofetch  
yes | apt install zsh 

echo -e "\n\n Finnished installing dependencies"
echo -e "\n\n Creating symbolic links"

ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig









#!/bin/bash

echo "Starting setup script..."

# update and upgrade
apt update
apt upgrade -y

# install dependencies
yes | apt install zsh neofetch htop vim"

echo "\n\n Finnished installing dependencies"
echo "\n\n Creating symbolic links"

ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig









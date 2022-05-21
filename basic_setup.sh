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

echo "Starting basic setup script..."
echo -e "\n -----------------------------------------------"

touch $PWD/local_configs.sh

mv $folder/.bashrc $folder/.bashrc.bk
mv /root/.bashrc /root/.bashrc.bk

ln -s $PWD/bashrc $folder/.bashrc
ln -s $PWD/vimrc $folder/.vimrc
ln -s $PWD/bashrc /root/.bashrc
ln -s $PWD /root/.dotfiles

chown -R $username:$username $folder

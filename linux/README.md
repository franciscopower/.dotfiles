# Dotfiles

*My Linux (debian) terminal configuration files.*


## Contents

This folder consists of:
- ZSH shell configuration files:
  + Custom prompt with vi keybindings and vi mode indicator, git status indicator and SSH connection indicator;
  + Aliases
  + Plugins:
    + zsh-syntax-highlighting;
    + zsh-autosuggestions.
- Setup script

## Setup script

T4he setup script performs the following actions:
- Verifies that the script is being run from inside the .dotfiles repository in the user's home folder;
- Updates and upgrades packages;
- Installs:
  + neovim
  + htop
  + neofetch
  + zsh
- Creates symbolic links from the configuration files in the .dotfiles repository to the place where they need to be in the user's home directory for the terminal to run.

## Setup process

1. Clone this repository into your home folder:
```bash
cd $HOME
git clone https://github.com/franciscopower/.dotfiles.git
cd .dotfiles/linux
```
2. Run the setup script:
```bash
sudo ./setup.sh [USERNAME]
```
3. Choose the default shell. Apply the following commands as root user (execute `sudo su` before the commands) if you want to have your costumizations in root too.
```bash
# for zsh
chsh -s $(which zsh)
# for bash
chsh -s $(which bash)
```
4. Restart the terminal.
 

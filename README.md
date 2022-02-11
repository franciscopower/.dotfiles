# Dotfiles

*My Linux (debian) terminal configuration files.*


## Contents

This repository consists of:
- ZSH shell configuration files:
  + Custom prompt with vi keybindings and vi mode indicator, git status indicator and SSH connection indicator;
  + Aliases
  + Plugins:
    + zsh-syntax-highlighting;
    + zsh-autosuggestions.
- Basic vim configuration file (vimrc);,
- Neovim configuration file (nvim/init.vim)
- Git configuration file (gitconfig)
- Setup script

## Setup script

The setup script performs the following actions:
- Verifies that the script is being run from inside the .dotfiles repository in the user's home folder;
- Updates and upgrades packages;
- Installs:
  + Python3
  + Pip3
  + ranger
  + neovim
  + vim
  + htop
  + neofetch
  + zsh
- Installs vim-plug (neovim plugin manager)
- Creates symbolic links from the configuration files in the .dotfiles repository to the place where they need to be in the user's home directory for the terminal to run.

## Setup process

1. Clone this repository into your home folder:
  ```bash
  cd $HOME
  git clone https://github.com/franciscopower/.dotfiles.git
  cd .dotfiles
  ```
2. Run the setup script:
  ```bash
  sudo ./setup.sh [USERNAME]
  ```
3. Install neovim plugins:
    1. Open the init.vim file in neovim: `nvim nvim/init.vim`
    2. Run the plugin install command: `:PlugInstall`
4. Set zsh as the default shell:
  ```bash
  chsh -s $(which zsh)
  ```
5. Restart the terminal.
  

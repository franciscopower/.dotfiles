# .dotfiles

This repository contains my windows and linux setups, as well as the configuration of nvim.

## NVim configuration

### Dependencies

0. NVim
    - [NVim for windows](https://neovim.io/)
1. C Compiler (gcc)
    - For windows: [MSYS2](https://code.visualstudio.com/docs/languages/cpp)
2. Packer - Nvim Plugin manager
    - [Packer Github](https://github.com/wbthomason/packer.nvim)

### Windows Instalation

After manually installing the dependencies, run:

```ps
cp -r nvim $HOME\AppData\Local
```

The LSP provider used is `Mason`. To install support for a specific language, run `:Mason`


# .dotfiles

This repository contains my windows and linux setups, as well as the configuration of nvim.

## NVim configuration

### Dependencies

0. NVim
    - [NVim for windows](https://neovim.io/)
1. C Compiler (gcc)
    - For windows: [MSYS2](https://code.visualstudio.com/docs/languages/cpp)

## Configuration on Windows

### Symbolic links

```powershell
New-Item -ItemType SymbolicLink -Path <LinkPath> -Target <TargetPath>
```

- `<LinkPath>`: The path where you want to create the symbolic link.
- `<TargetPath>`: The path of the directory you want to link to.

### Example
Suppose you want to create a symbolic link at `C:\LinkToDirectory` that points to `C:\OriginalDirectory`. You would use the following command:

```powershell
New-Item -ItemType SymbolicLink -Path "C:\LinkToDirectory" -Target "C:\OriginalDirectory"
```

### Notes
- You need administrative privileges to create symbolic links on Windows. Make sure to run PowerShell as an administrator.
- If the `LinkPath` already exists, the command will fail unless you use the `-Force` parameter to overwrite it.

### Use cases

1 - Wezterm setup:

 ```powershell
cd .dotfiles
mkdir $HOME\.config
New-Item -Path $HOME\.config\wezterm -ItemType SymbolicLink -Value .\wezterm
 ```

2 - Powershell profile:

```powershell
 New-Item -Path $PROFILE -ItemType SymbolicLink -Value .\windows\Microsoft.PowerShell_profile.ps1
```

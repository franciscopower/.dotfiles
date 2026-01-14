# Requires the installation of chocolatey (https://chocolatey.org/install)
# Run this script from the root of the repository

Install-Module Terminal-Icons
Install-Module posh-git
Install-Module PSFzf
Install-Module PSReadLine -Force

choco install fzf
choco install neovim
choco install zoxide
choco install oh-my-posh
choco install opencode

# choco install starship

rm $PROFILE
New-Item -Path $PROFILE -ItemType SymbolicLink -Value .\windows\Microsoft.PowerShell_profile.ps1
New-Item -Path ~\AppData\Local\nvim -ItemType SymbolicLink -Value .\nvim\
New-Item -Path ~\.config\opencode\opencode.jsonc -ItemType SymbolicLink -Value .\opencode.jsonc

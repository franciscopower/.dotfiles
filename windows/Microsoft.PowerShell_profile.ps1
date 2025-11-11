#Imports

# --- LazyLoad-Module helper ---
function LazyLoad-Module {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$ModuleName,
        [Parameter(Mandatory)] [string]$FunctionName,
        [Parameter(Mandatory)] [ScriptBlock]$TriggerAction,
        [Parameter(ValueFromRemainingArguments = $true)] $ArgsFromCaller
    )

    # Remove wrapper first (prevents recursion)
    Remove-Item "Function:\$FunctionName" -ErrorAction SilentlyContinue

    # Import the real module
    Import-Module $ModuleName -ErrorAction SilentlyContinue

    # Call the trigger with the user's arguments
    & $TriggerAction @ArgsFromCaller
}


# --- Lazy-load Terminal-Icons on first use ---
function Get-ChildItem {
    param([Parameter(ValueFromRemainingArguments = $true)] $Args)
    LazyLoad-Module -ModuleName Terminal-Icons -FunctionName Get-ChildItem -TriggerAction {
        Microsoft.PowerShell.Management\Get-ChildItem @Args
    } @Args
}

# --- Lazy-load posh-git on first git use ---
function git {
    param([Parameter(ValueFromRemainingArguments = $true)] $Args)
    LazyLoad-Module -ModuleName posh-git -FunctionName git -TriggerAction {
        & git @Args
    } @Args
}

# --- Lazy-load PSFzf on first fzf use ---
function fzf {
    param([Parameter(ValueFromRemainingArguments = $true)] $Args)
    LazyLoad-Module -ModuleName PSFzf -FunctionName fzf -TriggerAction {
        & fzf @Args
    } @Args
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
function choco {
    param([Parameter(ValueFromRemainingArguments = $true)] $Args)
    LazyLoad-Module -ModuleName $ChocolateyProfile -FunctionName choco -TriggerAction {
        & choco @Args
    } @Args
}

#Constants
$VaultPath = "$HOME\VAULT"
$ObsidianPath = "$HOME\Notes"
$DevPath = "C:\dev"
#Load constants from profile.local.ps1
$LocalProfilePath = "$PSScriptRoot\profile.local.ps1"
if (Test-Path $LocalProfilePath) {
    . $LocalProfilePath
} else {
    Write-Host "No local profile found, using defaults."
}

#general aliases
Set-Alias -Name v -Value nvim
Set-Alias -Name cf -Value cf8
Set-Alias -Name kc -Value kubectl
Set-Alias -Name lg -Value lazygit
Set-Alias -Name ai -Value GPTerminal.exe
Set-Alias -Name xp -Value explorer
#general functions
function cpath {(Get-Location).Path | Set-Clipboard}
#navigation helpers
function dev {cd $DevPath}
function vault {cd $VaultPath}
function c {cd C:\}
function .. {cd ..}
function ... {cd ../..}
function nvimconfig { cd $home\AppData\Local\nvim }
#finding files
function ff { ls -r | Invoke-Fzf }
function fa($a) {
  $ss = "*" + $a + "*"
  ls -r | Where-Object {$_.Name -like $ss}
}
#other
function weather($a) {
    $url = "http://wttr.in/$a"
    (Invoke-WebRequest $url).content
}
function New-MarkdownNote {
    param (
        [string]$FileName = "New Note",
        [string]$FolderPath = "$ObsidianPath\0 SPARK"
    )

    # Ensure the folder exists
    if (!(Test-Path -Path $FolderPath)) {
        New-Item -ItemType Directory -Path $FolderPath | Out-Null
    }

    $BaseName = [System.IO.Path]::GetFileNameWithoutExtension($FileName)
    $Extension = ".md"
    $FullPath = Join-Path -Path $FolderPath -ChildPath ($BaseName + $Extension)

    $Index = 1
    while (Test-Path -Path $FullPath) {
        $FullPath = Join-Path -Path $FolderPath -ChildPath ("$BaseName-$Index$Extension")
        $Index++
    }

    # Create the new file
    New-Item -ItemType File -Path $FullPath | Out-Null

    # Open in Neovim
    nvim $FullPath
}
Set-Alias -Name nn -Value New-MarkdownNote

Set-PSReadlineOption -EditMode vi
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Chord "Ctrl+k" -Function AcceptSuggestion
Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -PredictionViewStyle ListView

#PSFzf
$env:FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-Alias -Name cdf -Value Invoke-FuzzySetLocation

#git
function gfb {
  git checkout $(git branch | ForEach-Object { $_ -replace "^  ", "" } | Invoke-Fzf)
}
function gpb {
   git branch --merged | % { $_.trim() } | ? { $_ -ne "*" -and $_ -notmatch "master" } | % { git branch -d $_ }
}


#Oh-My-Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell.omp.json" | Invoke-Expression
# more themes here: https://ohmyposh.dev/docs/themes

#Zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) }) # zoxide - a better CD


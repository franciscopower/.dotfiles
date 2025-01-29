#Imports
Import-Module -Name Terminal-Icons
Import-Module -Name posh-git
Import-Module -Name PSFzf # requires `winget install fzf`

#general aliases
Set-Alias -Name v -Value nvim
Set-Alias -Name kc -Value kubectl
Set-Alias -Name lg -Value lazygit
Set-Alias -Name ai -Value GPTerminal.exe
Set-Alias -Name xp -Value explorer
#general functions
function cpath {(Get-Location).Path | Set-Clipboard}
#navigation helpers
function dev {cd C:\dev}
function vault {cd "C:\Users\pof1av\OneDrive - Bosch Group\VAULT"}
function c {cd C:\}
function .. {cd ..}
function ... {cd ../..}
function nvimconfig { cd $home\AppData\Local\nvim }
function weather($a) {
    $url = "http://wttr.in/$a"
    (Invoke-WebRequest $url).content
}

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

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#Oh-My-Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell.omp.json" | Invoke-Expression
# more themes here: https://ohmyposh.dev/docs/themes

#Zoxide
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) }) # zoxide - a better CD
##------------------------------------------------------------------------------
# # PROMPT
# function Write-BranchName () {
#    try {
#        $branch = git rev-parse --abbrev-ref HEAD

#        if ($branch -eq "HEAD") {
#            # we're probably in detached HEAD state, so print the SHA
#            $branch = git rev-parse --short HEAD
#            Write-Host "($branch)" -ForegroundColor "red" -NoNewline
#        }
#        else {
#            # we're on an actual branch, so print it
#            Write-Host "($branch)" -ForegroundColor "Green" -NoNewline
#        }
#    } catch {
#        # we'll end up here if we're in a newly initiated git repo
#        Write-Host "()" -ForegroundColor "yellow" -NoNewline
#    }
# }

# function prompt {

#    $cmdResult = $?;

#    #Configure current user, current folder and date outputs
#    $CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
#    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
#    $currentDirectory = Get-Location
#    $currentDrive = Split-Path -qualifier $currentDirectory.Path
#    $uncPath = $currentDirectory.Path.Replace($currentDrive, '')
#    $PathInfo = [System.Uri]$uncPath;

#    # Test for Admin / Elevated
#    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

#    #Decorate the CMD Prompt
#    Write-Host ""
#    Write-host ($(if ($IsAdmin) { 'ELEVATED ' } else { '' })) -ForegroundColor Red -NoNewline
#    Write-Host "$($CmdPromptUser.Name.split("\")[1]) " -ForegroundColor DarkCyan -NoNewline
#    Write-Host "in" -ForegroundColor White -NoNewline

#    If ($CmdPromptCurrentFolder -like "*:*") {
#        Write-Host " $CmdPromptCurrentFolder "  -ForegroundColor DarkCyan -NoNewline
#    }
#    else {
#        Write-Host " .\$CmdPromptCurrentFolder\ "  -ForegroundColor DarkCyan -NoNewline
#    }
#    Write-host ($(if ($PathInfo.IsUnc){ '(online) ' } else { '' })) -ForegroundColor DarkYellow -NoNewline

#    If ($cmdResult -eq "True") { 
#        Write-Host "[OK]" -ForegroundColor Green -NoNewline
#    }
#    else {
#        Write-Host "[NOK]" -ForegroundColor red -NoNewline
#    }

#    Write-Host "" #New line

#    if (Test-Path .git) {
#        Write-BranchName
#    }

#    Write-Host ">" -NoNewLine

#    return " "
# } #end prompt function

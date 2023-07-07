#Imports
Import-Module -Name Terminal-Icons
Import-Module -Name posh-git

New-Alias v nvim

function xp {Explorer .}
function gaa {git add .}
function gl {git log --oneline}
function gc {git commit -m "$args[0]"}
function gs {git status}
function gtree {git log --all --graph}
function dev {cd C:\dev}
function c {cd C:\}
function franc {cd $home}
function .. {cd ..}
function ... {cd ../..}
function cumulus {ssh -p 314 fp-server@192.168.0.201}
function nvimconfig {cd $home\AppData\Local\nvim}

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

#------------------------------------------------------------------------------
# PROMPT
function Write-BranchName () {
    try {
        $branch = git rev-parse --abbrev-ref HEAD

        if ($branch -eq "HEAD") {
            # we're probably in detached HEAD state, so print the SHA
            $branch = git rev-parse --short HEAD
            Write-Host "($branch)" -ForegroundColor "red" -NoNewline
        }
        else {
            # we're on an actual branch, so print it
            Write-Host "($branch)" -ForegroundColor "Green" -NoNewline
        }
    } catch {
        # we'll end up here if we're in a newly initiated git repo
        Write-Host "()" -ForegroundColor "yellow" -NoNewline
    }
}

function prompt {

    $cmdResult = $?;

    #Configure current user, current folder and date outputs
    $CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf
    $CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();
    $currentDirectory = Get-Location
    $currentDrive = Split-Path -qualifier $currentDirectory.Path
    $uncPath = $currentDirectory.Path.Replace($currentDrive, '')
    $PathInfo = [System.Uri]$uncPath;

    # Test for Admin / Elevated
    $IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

    #Decorate the CMD Prompt
    Write-Host ""
    Write-host ($(if ($IsAdmin) { 'ELEVATED ' } else { '' })) -ForegroundColor Red -NoNewline
    Write-Host "$($CmdPromptUser.Name.split("\")[1]) " -ForegroundColor DarkCyan -NoNewline
    Write-Host "in " -ForegroundColor White -NoNewline

    If ($CmdPromptCurrentFolder -like "*:*") {
        Write-Host " $CmdPromptCurrentFolder "  -ForegroundColor DarkCyan -NoNewline
    }
    else {
        Write-Host ".\$CmdPromptCurrentFolder\ "  -ForegroundColor DarkCyan -NoNewline
    }
    Write-host ($(if ($PathInfo.IsUnc){ '(online) ' } else { '' })) -ForegroundColor DarkYellow -NoNewline

    If ($cmdResult -eq "True") { 
        Write-Host "[OK]" -ForegroundColor Green -NoNewline
    }
    else {
        Write-Host "[NOK]" -ForegroundColor red -NoNewline
    }

    Write-Host ""
    if (Test-Path .git) {
        Write-BranchName
    }


    return " > "
} #end prompt function

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

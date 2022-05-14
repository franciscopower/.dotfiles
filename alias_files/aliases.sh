alias l='ls -la'
alias nv='nvim'
alias vn='nvim'
alias ra='ranger'

alias ...='cd .. && cd ..'

alias snv='sudo -E -s nvim' # use Neovim as sudo but preserve environment

alias gs='git status' # View Git status.
alias ga='git add' # Add a file to Git.
alias gaa='git add --all' # Add all files to Git.
alias gc='git commit' # Commit changes to the code.
alias gl='git log --oneline' # View the Git log.
alias gb='git checkout -b' # Create a new Git branch and move to the new branch at the same time. 
alias gd='git diff' # View the difference.

mmv () {
  mkdir $1
  cd $1
}

cdl () {
  cd $1
  ls
}

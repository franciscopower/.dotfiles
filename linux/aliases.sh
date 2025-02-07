alias l='ls -la'
alias v='nvim'

alias ..='cd ..'
alias ...='cd .. && cd ..'

alias snv='sudo -E -s nvim' # use Neovim as sudo but preserve environment

mmv () {
  mkdir $1
  cd $1
}

cdl () {
  cd $1
  ls
}

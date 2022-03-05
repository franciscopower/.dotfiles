alias ls='ls --color=auto'
alias l='ls -la'
alias nv='nvim'
alias vn='nvim'
alias ra='ranger'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

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

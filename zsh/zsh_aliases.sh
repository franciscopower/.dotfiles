alias ls='ls --color=auto'
alias l='ls -la'
alias nv='nvim'
alias vn='nvim'
alias ra='ranger'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias ...='cd .. && cd ..'

mmv () {
  mkdir $1
  cd $1
}

cdl () {
  cd $1
  ls
}

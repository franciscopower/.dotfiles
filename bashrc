#Set BASH directory
BASH=$HOME/.dotfiles/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# tab autocompletion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

#Set vim keybindings
set -o vi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#source other config files
if [ -f $BASH/bash_aliases.sh ]; then
	source "$BASH/bash_aliases.sh"
fi
if [ -f $BASH/bash_local_aliases.sh ]; then
	source "$BASH/bash_local_aliases.sh"
fi
if [ -f $BASH/bash_prompt.sh ]; then
	source "$BASH/bash_prompt.sh"
else
	PS1="\u in \W > "
fi
if [ -f $BASH/bash_functions.sh ]; then
	source "$BASH/bash_functions.sh"
fi

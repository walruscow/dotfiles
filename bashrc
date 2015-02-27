# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
# Security issue; disable this
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\w \[\033[1;36m\]$\[\033[0m\] '

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# enable programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/complete-aliases.sh ]; then
  . ~/.complete-aliases.sh
fi

if [ -f ~/.complete-git.sh ]; then
  . ~/.complete-git.sh
  __git_complete g __git_main
  __git_complete gc _git_checkout
  __git_complete gb _git_branch
fi

export PATH=$PATH:$HOME/.bin

set -o vi

export EDITOR=vim

# Source our virtualenv, but do not change prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
source ~/.venv/bin/activate

# Toggle touchpad
function touchpad-toggle {
  SYNSTATE=$(synclient -l | grep TouchpadOff | awk '{ print $3 }')
  if [ $SYNSTATE = 0 ]; then
    synclient touchpadoff=1
    echo "Touchpad turned OFF"
  elif [ $SYNSTATE = 1 ]; then
    synclient touchpadoff=0
    echo "Touchpad turned ON"
  else
    echo "Could not get status from synclient"
    exit 1
  fi
}

# Automatically source virtualenv
function cd() {
  builtin cd "$@"
  DIR_LIMIT=100
  d=$(pwd)
  n=0
  while true; do
    if [ -f "$d/.venv/bin/activate" ]; then
      . "$d/.venv/bin/activate"
      break
    fi
    d=$(dirname $d)
    n=$((n + 1))
    if [ "$d" = "/" ] || [ "$n" -eq "$DIR_LIMIT" ] ; then
      break;
    fi
  done
}

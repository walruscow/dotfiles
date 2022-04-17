# ~/.bashrc: executed by bash(1) for non-login shells.
#set -x

# Show how many shells deep we are, without overcounting from re-source
_WMCD_SOURCE_COUNT=$((_WMCD_SOURCE_COUNT+1))
if [ $_WMCD_SOURCE_COUNT == 1 ]; then
  export _WMCD_BASH_DEPTH=$((_WMCD_BASH_DEPTH+1))
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

PS1='\w \[\033[1;36m\]$\[\033[0m\] '
# Show how many shells deep we are, without overcounting from re-source
if [[ $_WMCD_BASH_DEPTH > 1 ]]; then
  PS1="[$_WMCD_BASH_DEPTH] $PS1"
fi

function _opt_alias() {
  type $2 &>/dev/null && alias $1="$2"
}

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
# Make a new one like
#  sudo apt install python3.8-venv
#  python3 -m venv .venv
export VIRTUAL_ENV_DISABLE_PROMPT=1
#source ~/.venv/bin/activate

function _source_local_venv() {
  # These can't be local vars since we use them inside the below loop
  _WMCD_DIR_LIMIT=100
  _wmcd_d=$(pwd)
  _wmcd_n=0
  while true; do
    if [ -f "$_wmcd_d/.venv/bin/activate" ]; then
      . "$_wmcd_d/.venv/bin/activate"
      break
    fi
    _wmcd_d=$(dirname $_wmcd_d)
    _wmcd_n=$((_wmcd_n + 1))
    if [ "$_wmcd_d" = "/" ] || [ "$_wmcd_n" -eq "$_WMCD_DIR_LIMIT" ] ; then
      break;
    fi
  done
}

_source_local_venv

# Automatically source virtualenv
function cd() {
  builtin cd "$@"
  _source_local_venv
}

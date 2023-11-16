PROMPT='%8~ %F{cyan}%#%f '

function _opt_alias() {
  type $2 &>/dev/null && alias $1="$2"
}

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

export EDITOR=vim
set -o vi

# recursive find/replace
function seds() {
  rg -l "$1" | xargs sed -i "s/$1/$2/g"
}

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

alias history='history 1'
function _history_grep() {
  history | rg --color always $@ | tail -20
}
alias 'h?=_history_grep'

# disable ctrl-S
stty -ixon

# local extensions to our zshrc that we don't want checked in
# this lets us have a clean git repo here while supporting
# proprietary environments
_LOCAL_ZSH="$HOME/.zshlocal"
if [ -f "$_LOCAL_ZSH" ]; then
    . "$_LOCAL_ZSH"
fi

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


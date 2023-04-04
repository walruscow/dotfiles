#!/bin/bash
for f in aliases bashrc complete-aliases.sh complete-git.sh gitconfig vimrc zshrc; do
  if ! [[ $(realpath ~/.$f) == $(realpath $f) ]]; then
    mv ~/.$f ~/.$f.bk &>/dev/null
    ln -fs $(pwd)/$f ~/.$f
  fi
done

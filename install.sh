for f in aliases bashrc complete-aliases.sh complete-git.sh gitconfig vimrc; do
  if ! [[ $(realpath ~/.$f) == $(realpath $f) ]]; then
    mv ~/.$f ~/.$f.bk &>/dev/null
    ln -s $(pwd)/$f ~/.$f
  fi
done

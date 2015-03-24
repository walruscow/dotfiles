for f in aliases bashrc complete-aliases.sh complete-git.sh gitconfig vimrc; do
  cp ~/.$f ~/.$f.bk
  cp $f ~/.$f
done

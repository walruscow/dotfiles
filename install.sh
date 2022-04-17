for f in aliases bashrc complete-aliases.sh complete-git.sh gitconfig vimrc; do
  mv ~/.$f ~/.$f.bk
  ln -s $(pwd)/$f ~/.$f 
done

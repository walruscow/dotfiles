import os

dotfiles = {
    'aliases': '~/.aliases',
    'bashrc': '~/.bashrc',
    'complete-aliases.sh': '~/.complete-aliases.sh',
    'complete-git.sh': '~/.complete-git.sh',
    'gitconfig': '~/.gitconfig',
    'vimrc': '~/.vimrc',
    'zshrc': '~/.zshrc',
    'tmux.conf': '~/.tmux.conf',
    'nvim_init.lua': '~/.config/nvim/init.lua',
    'fix_path.py': '~/.bin/fix_path.py',
}
src_dir = os.path.dirname(os.path.realpath(__file__))
dotfiles = {os.path.join(src_dir, s): d for s, d in dotfiles.items()}

for src in dotfiles:
    if not os.path.exists(src):
        raise Exception(f'Source file "{src}" does not exist, cancelling')

for src, dest in dotfiles.items():
    dest = os.path.expanduser(dest)

    if src != os.path.realpath(dest):
        if os.path.exists(dest):
            os.rename(dest, dest + '.bk')
    
        print(f'Pointing {dest} to {src}')
        os.makedirs(os.path.dirname(dest), exist_ok=True)
        os.symlink(src, dest)

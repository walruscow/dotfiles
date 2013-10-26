set nu
set tildeop
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set nobackup
set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on

" Highlight whitespace at the end of lines
highlight ExtraWhitespace ctermbg=darkgreen
au ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" 2 tab spacing in javascript and clojure
au FileType clj,javascript set shiftwidth=2
au FileType clj,javascript set tabstop=2
au FileType clj,javascript set softtabstop=2
set hlsearch
nmap <space> :noh <CR>

" Save cursor position on J
nnoremap J mUJ`U

" Do not continue comments
au FileType javascript,c,cpp setlocal comments-=:// comments+=f://
au FileType vim setlocal comments-=:" comments+=f:"

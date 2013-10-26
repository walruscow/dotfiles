" Line numbering is nice
set nu

" We want tilde to be an op so we can move with it
set tildeop

" 4 space tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Spaces are preferred to tabs for ease of insertion
set expandtab

" VIM is not VI
set nocompatible

syntax on
filetype on
filetype plugin on
filetype indent on

" Highlight whitespace at the end of lines
" Create a new colour scheme
highlight ExtraWhitespace ctermbg=darkgreen
" Add this colour scheme so it is always on
au ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen
" Match all trailing whitespace /\s\+$/
" but not for lines where we are currently appending to
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" 2 tab spacing in javascript and clojure
au FileType clj,javascript set shiftwidth=2
au FileType clj,javascript set tabstop=2
au FileType clj,javascript set softtabstop=2

" Highlight search results
set hlsearch

" Remove search highlighting on space
nmap <space> :noh <CR>

" Save cursor position on J
nnoremap J mUJ`U

" Do not continue comments in JS, C, C++
au FileType javascript,c,cpp setlocal comments-=:// comments+=f://

" Insert newline when hitting enter
nnoremap <CR> o<Esc>k
" Insert newline before this one when hitting shift-enter
" This doesn't work in terminal VIM
nnoremap <S-Enter> O<Esc>j

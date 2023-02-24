" Line numbering is nice
set nu

" We want tilde to be an op so we can move with it
set tildeop

" 2 space tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2

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
au BufEnter * match ExtraWhitespace /\s\+$/

" 4 tab spacing in python
au FileType python set shiftwidth=4
au FileType python set tabstop=4
au FileType python set softtabstop=4

" Highlight search results
set hlsearch

" Black column at 80
set cc=80
highlight ColorColumn ctermbg=0

" Save cursor position on J
nnoremap J mUJ`U

" Do not continue comments
au FileType java,javascript,c,cpp setlocal comments-=:// comments+=f://
au FileType python,coffee setlocal comments-=:# comments+=f:#

" Insert newline when hitting enter
nnoremap <CR> o<Esc>k
" Insert newline before this one when hitting shift-enter
" This doesn't work in terminal VIM
nnoremap <S-Enter> O<Esc>j

" Don't move when searching current word
nnoremap # #N

" execute pathogen#infect()

let mapleader = "\<Space>"

" Remove search highlighting on comma
nmap , :noh <CR>
set showcmd

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" No annoying sounds
set belloff=all

" .vimrc
set nocompatible " vim not vi
execute pathogen#infect()
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
filetype plugin indent on

let mapleader=","

set rnu
set history=1000
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set shiftround
set cursorline
set backup
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set nrformats-=octal
set ttimeout
set ttimeoutlen=50
set incsearch
set hlsearch
map <leader>l :nohlsearch<cr>

" highlight trailing whitespace
set list listchars=tab:»·,trail:·
" ',s' removes trailing whitespace
function! StripWhitespace ()
  exec ':%s/ \+$//gc'
endfunction
map <leader>s :call StripWhitespace ()<cr>

" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" window pane movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" ctrl-s saves, NB 'stty -ixon' in .zshrc
:nmap <c-s> :w<cr>
:imap <c-s> <esc>:w<cr>a
:imap <c-s> <esc><c-s>
" ctrl-p: https://github.com/kien/ctrlp.vim
nnoremap <leader>p :CtrlP<CR>

augroup vimrcEx
    autocmd!
augroup END

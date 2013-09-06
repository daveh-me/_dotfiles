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
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
set showcmd
set nrformats-=octal
set ttimeout
set ttimeoutlen=50
set laststatus=2
set scrolloff=3
set incsearch
set hlsearch
set splitbelow
set splitright
" emacs movement in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0

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
" swap to alternate buffer
nnoremap <leader><leader> <c-^>

augroup vimrcEx
    autocmd!
    autocmd FileType text setlocal textwidth=78
    " Jump to last cursor position unless it's invalid or in an event
    " handler
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
    " markdown files
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80
    " ruby
    autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

    " see below used to remove search highlight
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()
augroup END

function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

let g:html_indent_tags = 'li\|p'
" Index ctags from any project, including those outside Rails
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
map <Leader>ct :!ctags -R .<CR>


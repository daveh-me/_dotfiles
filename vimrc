" .vimrc
set nocompatible " vim not vi
execute pathogen#infect()
syntax on
set encoding=utf-8
set synmaxcol=200
filetype plugin indent on

" colours
set background=dark
syntax enable
let g:solarized_termcolors=256
colorscheme solarized
set t_Co=256
set t_ut=

let mapleader=","

set rnu
set history=1000
set hidden
set autoread
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set cursorline
set ruler
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
set ignorecase
set smartcase
set splitbelow
set splitright

" emacs movement in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$

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

nnoremap ;; :
nnoremap ;bd :bd<cr>
nnoremap ;bn :bn<cr>
nnoremap ;bp :bp<cr>
nnoremap ;e :e 
inoremap ;l <esc>
inoremap ;k <esc>:update<cr>
nnoremap ;k :w<cr>
inoremap ;j <c-O>:update<cr>
nnoremap ;j :update<cr>
nnoremap ;q :q<cr>
inoremap ;x <esc>:x<cr>
nnoremap ;x :x<cr>
nnoremap ;n :NERDTree<cr>

vmap <expr> <LEFT> DVB_Drag('left') 
vmap <expr> <RIGHT> DVB_Drag('right') 
vmap <expr> <DOWN> DVB_Drag('down') 
vmap <expr> <UP> DVB_Drag('up')

" swap to alternate buffer
nnoremap <leader><leader> <c-^>
" swap to alternate file
nnoremap <leader>a :A<cr>

" vim-rspec
let g:rspec_command = "Dispatch zeus rspec -fp -b {spec}"
map <Leader>mt :call RunCurrentSpecFile()<CR>
map <Leader>mm :call RunNearestSpec()<CR>
map <Leader>ml :call RunLastSpec()<CR>
map <Leader>ma :call RunAllSpecs()<CR>

map <Leader>t :tabnew<cr>
map <Leader>gs :Gst<cr>
map <Leader>gc :Gcommit -v<cr>
map <Leader>gw :Gwrite<cr>

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
map <leader>f :call RenameFile()<cr>
map <leader>b :b 

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

let g:html_indent_tags = 'li\|p'
" Index ctags from any project, including those outside Rails
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
map <Leader>ct :!ctags -R .<CR>

let g:CommandTWildIgnore=&wildignore . ",**public/system/*,**tmp/*"

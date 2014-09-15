set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Use 4 tabs and softabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set backspace=indent,eol,start "" Works also with backspace=2
set t_kD=[3;*~
set t_kb=

" Color Scheme
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme wombat256mod

" AirLine Configuration
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
"let g:airline#extensions#tabline#left_sep = ' | '
"let g:airline#extensions#tabline#left_alt_sep = '|'

set encoding=utf8
set ffs=unix,dos,mac
set nocp

"" Screen Configuration
set number
set nowrap

"" History & Undo Levels
set history=700
set undolevels=700

"" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

""" Plugins in Bundle Folder
execute pathogen#infect()
filetype off
syntax on
filetype plugin indent on

"" Autoreload vimrc on save
augroup reload_vimrc " {
   autocmd!
   autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set mouse=a

"" Make Search Case Insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
set magic

"set nofoldenable
set ruler
set cmdheight=2
set hid

set whichwrap+=<,>,h,l

set splitright
set lazyredraw
set showmatch
set mat=2

"" Mappings
let mapleader = ","
nnoremap <Leader>b :buffers<CR>:buffer<Space>

vnoremap <Leader>s :sort<CR>

noremap <Leader>e :bd<CR>
noremap <Leader>E :bd!<CR>
noremap <Leader>` :qa!<CR>

nnoremap th  :tabprevious<CR>
nnoremap tl  :tabnext<CR>
nnoremap tt  :tabnew<CR>
nnoremap tw  :tabclose<CR>

nnoremap <C-Z> u
nnoremap  <C-R>

" Move Between Buffers
nnoremap <Super>i :update<CR>

" Search and Replace
nnoremap <Leader>/ :%s/
vnoremap <Leader>/ <C-C>:%s/

" Clean Search Results
nnoremap <F3> :set hlsearch!<CR>

"" Splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
set noesckeys

map <leader>R <C-W>R

"vnoremap <unt> * :call VisualSelection('f')<cR>
"vnoremap <silent> # :call VisualSelection('b')<CR>

nnoremap <C-/> :let @/ = ""<CR>
inoremap <C-/> <C-O>:let @/ = ""<CR>
vnoremap <c-/> <c-c>:let @/ = ""<cr>v

"" Fix Delete Key
nmap [3;*~ "_x
inoremap [3;*~ <C-O>"_xi

"" MouseWheel
map <ScrollWheelUp> <C-Y>

nnoremap <Leader>n :NERDTree<cr>
inoremap <Leader>n <C-O>:NERDTree<cr>
vnoremap <Leader>n <c-c>:NERDTree<cr>

nnoremap <C-,> :cprev<cr>
inoremap <C-,> <C-O>:cprev<cr>
vnoremap <C-,> <c-c>:cprev<cr>

nnoremap <C-.> :cnext<cr>
inoremap <C-.> <C-O>:cnext<cr>
vnoremap <C-.> <c-c>:cnext<cr>

autocmd VimEnter * :NERDTree

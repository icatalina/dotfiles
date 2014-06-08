set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
"let &t_AB="\e[48;5;%dm"
"let &t_AF="\e[38;5;%dm"
colorscheme wombat256mod
set number
set nocp

"" Plugins in Bundle Folder
execute pathogen#infect()
filetype off
syntax on
filetype plugin indent on

set backspace=indent,eol,start "" Works also with backspace=2
let g:airline_theme='molokai'
let mapleader = ","

set mouse=a
set clipboard=unnamed

set wrap
set linebreak
set nolist " list disables linebreak

set relativenumber

set textwidth=0
set wrapmargin=0

set ignorecase
set smartcase
set incsearch

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' | '
let g:airline#extensions#tabline#left_alt_sep = '|'

nnoremap <F5> :buffers<CR>:buffer<Space>
map <Leader>m <Esc>:tabn<CR>
map <Leader>n <Esc>:tabp<CR>

" map control-backspace to delete the previous word


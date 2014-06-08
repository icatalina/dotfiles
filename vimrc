" Autoreload vimrc on save
augroup reload_vimrc " {
   autocmd!
   autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Color Scheme
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
colorscheme wombat256mod


set encoding=utf8
set ffs=unix,dos,mac
set nocp

" Screen Configuration
set number
set nowrap

" History & Undo Levels
set history=700
set undolevels=700

"" Plugins in Bundle Folder
execute pathogen#infect()
filetype off
syntax on
filetype plugin indent on

" Use 4 tabs and softabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set backspace=indent,eol,start "" Works also with backspace=2

set mouse=a

set autoread

set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

set pastetoggle=<F2>
set clipboard=unnamed

set nowrap
set linebreak
set nolist " list disables linebreak

set relativenumber

set textwidth=0
set wrapmargin=0

" Make Search Case Insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
set magic

set nofoldenable
set ruler
set cmdheight=2
set hid

set whichwrap+=<,>,h,l

set lazyredraw
set showmatch
set mat=2

" AirLine Configuration
let g:airline_theme='kolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
"let g:airline#extensions#tabline#left_sep = ' | '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" Mappings
let mapleader = ","
nnoremap <Leader>b :buffers<CR>:buffer<Space>

vnoremap <Leader>s :sort<CR>

inoremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

nnoremap th  :tabprevious<CR>
nnoremap tl  :tabnext<CR>
nnoremap tt  :tabnew<CR>
nnoremap tw  :tabclose<CR>

nnoremap <C-Z> :update<CR>
inoremap <C-Z> <C-O>:update<CR>
vnoremap <C-Z> <C-C>:update<CR>v

" Splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>r <C-W>R
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

set splitright


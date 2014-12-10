set nocompatible

set diffexpr=MyDiff()
if !exists("*MyDiff")
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
endif


" prevent vim from adding that stupid empty line at the end of every file
set noeol
set binary

hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

set shell=/bin/bash     " use bash for shell commands
set hidden              " enable multiple modified buffers
set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim
set cinoptions=:0,(s,u0,U1,g0,t0 " some indentation options ':h cinoptions' for details
set autoindent          " automatically indent new line

" Share clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" AirLine Configuration
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
"let g:airline#extensions#tabline#left_sep = ' | '
"let g:airline#extensions#tabline#left_alt_sep = '|'

let NERDTreeIgnore=['\.DS_Store$']

nmap <F6> <Plug>ColorstepPrev
nmap <F7> <Plug>ColorstepNext
nmap <S-F7> <Plug>ColorstepReload

set encoding=utf8
set ffs=unix,dos,mac
set nocp

"" Screen Configuration
set number
set numberwidth=3       " number of culumns for line numbers
set nowrap
set relativenumber

"" History & Undo Level
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

set wildmenu            " enhanced command completion
set visualbell          " use visual bell instead of beeping

"set nofoldenable
set ruler
set cmdheight=2
set hid

set whichwrap+=<,>,h,l

set splitright
set lazyredraw
set showmatch
set mat=2

"" Mapping
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

" Move Between Buffer
nnoremap <Super>i :update<CR>

" Search and Replace
nnoremap <Leader>/ :%s/
vnoremap <Leader>/ <C-C>:%s/

"" Split
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

"" CtrlP excluded folder
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache)|node_modules|target$',
 \ 'file': '\v\.(exe|so|dll)$',
 \ 'link': 'some_bad_symbolic_links',
 \ }

"" JSHint
nnoremap <silent><F1> :SyntasticCheck<CR>
inoremap <silent><F1> <C-O>:SyntasticCheck<CR>
vnoremap <silent><F1> :SyntasticCheck<CR>

"" MouseWheel
"" map <ScrollWheelUp> <C-Y>

nnoremap <Leader>n :NERDTree<cr>
inoremap <Leader>n <C-O>:NERDTree<cr>
vnoremap <Leader>n <c-c>:NERDTree<cr>

"Remove NERDTree Sidebar
set guioptions-=L

nnoremap <C-,> :cprev<cr>
inoremap <C-,> <C-O>:cprev<cr>
vnoremap <C-,> <c-c>:cprev<cr>

nnoremap <C-.> :cnext<cr>
inoremap <C-.> <C-O>:cnext<cr>
vnoremap <C-.> <c-c>:cnext<cr>

"" Mapping
let mapleader = ","

" Show buffers an change
nnoremap <Leader>b :buffers<CR>:buffer<Space>

"Sort in visual mode
vnoremap <Leader>s :sort<CR>

noremap <Leader>e :bp<bar>sp<bar>bn<bar>bd<CR>
noremap <Leader>E :bp<bar>sp<bar>bn<bar>bd!<CR>
noremap <Leader>` :qa!<CR>

nnoremap <Leader>h  :tabprevious<CR>
nnoremap <leader>l  :tabnext<CR>
nnoremap <Leader>t  :tabnew<CR>
nnoremap <Leader>w  :tabclose<CR>

noremap <C-U> <C-R>

" Save
nnoremap <C-Z> :update<CR>
inoremap <C-Z> <C-O>:update<CR>
vnoremap <c-Z> <c-c>:update<CR>v

" Search and Replace
nnoremap <Leader>/ :%s/
vnoremap <Leader>/ <C-C>:%s/

"" Split
map <c-j> <Down>
map <c-k> <Up>
map <c-l> <Right>
map <c-h> <>h

map <leader>R <C-W>R
map <leader>r <C-W>R

"vnoremap <unt> * :call VisualSelection('f')<cR>
"vnoremap <silent> # :call VisualSelection('b')<CR>
"Double slash removes the prevous search
nnoremap // :let @/ = ""<CR>
vnoremap // <c-c>:let @/ = ""<cr>v

"" Fix Delete Key
nmap [3;*~ "_x
inoremap [3;*~ <C-O>"_x

nnoremap <Leader>n :NERDTreeTabsToggle<cr>
vnoremap <Leader>n <c-c><plug>NERDTreeTabsToggle<cr>
nmap <leader>m :NERDTreeFind<CR>

nnoremap #9 :cprev<cr>
inoremap #9 <C-O>:cprev<cr>
vnoremap #9 <c-c>:cprev<cr>

nnoremap #10 :cnext<cr>
inoremap #10 <C-O>:cnext<cr>
vnoremap #10 <c-c>:cnext<cr>

au BufReadPost *.ftl set filetype=ftl

"" YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']

"" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsListSnippets="<C-S-Space>"
let g:UltiSnipsJumpForwardTrigger="<C-Space>"
let g:UltiSnipsJumpBackwardTrigger="<C-S-Space>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let base16colorspace=256

" Color Scheme
"set term=xterm
"set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set background=dark

if !empty($BASE16_SHELL)
    colorscheme base16-ocean
else
    colorscheme wombat256mod
endif

" Use 4 tabs and softab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set backspace=indent,eol,start "" Works also with backspace=2
set t_kD=[3;*~
set t_kb=

autocmd VimEnter * :NERDTreeTabsToggle
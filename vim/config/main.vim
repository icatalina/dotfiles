
" prevent vim from adding that stupid empty line at the end of every file
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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

set laststatus=2
"" let g:airline#extensions#tabline#left_sep = ' | '
"" let g:airline#extensions#tabline#left_alt_sep = '|'

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

let g:NERDTreeBookmarksFile = $VIMTEMP."/_vimNerdTreeBookMarks"

try
	let $VIMUNDODIR = $VIMTEMP."/_vimundodir"
    call CreateIfNotExist($VIMUNDODIR)
    set undodir=$VIMUNDODIR
    set undofile
catch
endtry

set viminfo+=n$VIMTEMP/_viminfo

"" backup to ~/.tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

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

"" Split
"set noesckeys

" Color Scheme
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set background=dark

if !empty($BASE16)
    let base16colorspace=256
    colorscheme base16-default
else
    colorscheme wombat256mod
endif

hi Search cterm=NONE ctermbg=8 ctermfg=NONE guibg=gray30 guifg=NONE

" Use 4 spaces and softab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set expandtab
set backspace=indent,eol,start "" Works also with backspace=2
set t_kD=[3;*~
set t_kb=

"" Fix Delete Key
nmap [3;*~ "_x
inoremap [3;*~ <C-O>"_x

"let mapleader = "<space>"
so $VIMCONFIG/main.functions.vim
so $VIMCONFIG/main.ctrlp.vim
so $VIMCONFIG/main.buffergator.vim
so $VIMCONFIG/main.ultisnips.vim
so $VIMCONFIG/main.filedef.vim
so $VIMCONFIG/main.syntastic.vim
so $VIMCONFIG/main.silver-search.vim

" Mappings
so $VIMCONFIG/main.uppercasecommands.vim
so $VIMCONFIG/main.keymaps.vim

"" Detect Indent
"let g:detectindent_preferred_expandtab = 1
"let g:detectindent_preferred_indent = 4
"let g:detectindent_max_lines_to_analyse = 1024

"autocmd BufNewFile,BufReadPost * :DetectIndent
"autocmd FileType make setlocal noexpandtab

"" YouCompleteMe
"let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" Show commands on the bar
set showcmd

"  autocmd VimEnter * :NERDTreeTabsToggle
let NERDTreeIgnore=['\.DS_Store$']
let g:nerdtree_tabs_open_on_gui_startup=0

if isdirectory(expand('%'))
    let vimInitDir = expand('%')
endif

"if (expand('%') == '' && exists('vimInitDir') &&  isdirectory(vimInitDir)) || isdirectory(expand('%'))
"    cd `=vimInitDir`
"    let g:nerdtree_tabs_open_on_gui_startup=1
"    let g:nerdtree_tabs_open_on_console_startup=1
"    autocmd VimEnter * bd
"endif


" Prevent slow down on logn lines
set synmaxcol=300

"let g:NERDTreeHijackNetrw=0
autocmd Filetype gitcommit setlocal spell textwidth=72
au BufNewFile,BufRead *.html set filetype=htmldjango

" Opening Split bottom and right
set splitbelow
set splitright

" GitGutter
let g:gitgutter_enabled = 1
let g:gitgutter_max_signs = 500  " default value

" Closetags.vim - Files to activate the plugin in.
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Vim Angular - FileName Conversion 'camelcased' or 'titlecased' or nothing
" for dasherized
let g:angular_filename_convention = 'camelcased'

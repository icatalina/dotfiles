hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

"set shell=/usr/bin/env\ bash    " use bash for shell commands
set hidden              " enable multiple modified buffers
set autoread            " automatically read file that has been changed on disk and doesn't have changes in vim
set cinoptions=:0,(s,u0,U1,g0,t0 " some indentation options ':h cinoptions' for details
set autoindent          " automatically indent new line
set complete-=i         " Disables included file completion, seems to be quicker

" Share clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard+=unnamed
endif

set encoding=utf8
set ffs=unix,dos,mac
set nocp

"" Screen Configuration
set number
set numberwidth=3       " number of culumns for line numbers
set nowrap
set relativenumber

filetype off
syntax on
filetype plugin indent on

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

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=7
set sidescrolloff=10

set whichwrap+=<,>,h,l,[,]

set lazyredraw
set showmatch
set mat=2

set ttimeout
set ttimeoutlen=100

" When included, as much as possible of the last line
" in a window will be displayed.
set display+=lastline

" Show some characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list!

" Delete comment character when joining commented lines
set formatoptions+=j

"" Split
"set noesckeys

" Color Scheme
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set background=dark

if !empty($BASE16_SHELL)
    let base16colorspace=256
    silent! colorscheme base16-default
else
    silent! colorscheme koala
endif

hi Search cterm=NONE ctermbg=8 ctermfg=NONE guibg=gray30 guifg=NONE

" Use 4 spaces and softab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set shiftround
set expandtab
set backspace=indent,eol,start "" Works also with backspace=2
set t_kD=[3;*~
set t_kb=

"" Fix Delete Key
nmap [3;*~ "_x
inoremap [3;*~ <C-O>"_x

" Show partial commands as they're being typed on the bar
set showcmd

" Prevent slow down on logn lines
set synmaxcol=400

autocmd Filetype gitcommit setlocal spell textwidth=72
"au BufNewFile,BufRead *.html set filetype=htmldjango

" Opening Split bottom and right
set splitbelow
set splitright

so $VIMCONFIG/main/functions.vim
so $VIMCONFIG/main/ctrlp.vim
so $VIMCONFIG/main/buffergator.vim
so $VIMCONFIG/main/ultisnips.vim
so $VIMCONFIG/main/filedef.vim
so $VIMCONFIG/main/syntastic.vim
so $VIMCONFIG/main/silver-search.vim
so $VIMCONFIG/main/airline.vim
so $VIMCONFIG/main/nerd.vim
so $VIMCONFIG/main/history.vim
so $VIMCONFIG/main/delimitmate.vim
so $VIMCONFIG/main/youcompleteme.vim
so $VIMCONFIG/main/gitgutter.vim
so $VIMCONFIG/main/closetags.vim
so $VIMCONFIG/main/listtoggle.vim

" Mappings
so $VIMCONFIG/main/uppercasecommands.vim
so $VIMCONFIG/main/keymaps.vim

" Patch for some keys in iterm
if !has('gui_running')
    so $VIMCONFIG/main/itermhook.vim
endif

" autocmd Filetype * call LongFiles()

autocmd BufEnter * :syntax sync minlines=500

" Allow the use of the mouse to adjust pane sizes
" within Tmux
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Keep window position when switching buffers
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif


set ruler          " Show Cursor position all the time
set cursorline     " Enable cursor line
set textwidth=140  " Set MAX text width

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set gdefault      " Add g as default on replaces
set magic         " Enable extended regexes
set noshowmode    " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around

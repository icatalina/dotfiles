call plug#begin('~/.vim/_plugged')

"" Plug 'gmarik/Vundle.vim'

" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-vinegar'
" Plug 'rizzatti/dash.vim'
" Plug 'tpope/vim-sensible'
"" Plug 'scrooloose/syntastic'
"Plug 'vim-scripts/simple-pairs'
"Plug 'rking/ag.vim'
"Plug 'jelera/vim-javascript-syntax'
" Vim Velocity Plug
" Plug 'lepture/vim-velocity'

" Plug 'pangloss/vim-javascript'
" Plug 'jonathanpatt/vim-koala'
" Location List
" Plug 'Valloric/ListToggle'
" Plug 'marijnh/tern_for_vim'
" Plug 'tmux-plugins/vim-tmux-focus-events'


" 005.851
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" 000.119
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
" 000.102
Plug 'ctrlpvim/ctrlp.vim'
" 000.123
Plug 'terryma/vim-multiple-cursors'

" 000.107
Plug 'benekastah/neomake', { 'on':  'Neomake' }
" 000.099
Plug 'scrooloose/nerdcommenter'

" Load on first insert mode
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'honza/vim-snippets', {'on': [] }
Plug 'Valloric/YouCompleteMe', { 'on': [], 'do': './install.py' }

augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe', 'vim-snippets')
                     \| call youcompleteme#Enable() | autocmd! load_us_ycm
augroup END

" 000.101
Plug 'editorconfig/editorconfig-vim'
" 000.104
Plug 'tpope/vim-surround'
" 000.106
Plug 'vim-scripts/matchit.zip'
" 000.105
Plug 'gabesoft/vim-ags', { 'on': 'Ags' }
" 000.101
Plug 'jeetsukumaran/vim-buffergator', { 'on': 'BuffergatorToggle' }
" 000.097
Plug 'airblade/vim-gitgutter'
" 000.111
Plug 'alvan/vim-closetag'
" 000.124
Plug 'Raimondi/delimitMate'
" 000.113
" Plug 'sjl/gundo.vim'

" Javascript Functionallity
Plug '29decibel/vim-stringify', { 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }

" Color Schemas
Plug 'chriskempson/base16-vim'

"" Syntaxes
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'dansomething/ftl-vim-syntax', { 'for': 'ftl' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elzr/vim-json'
Plug 'evidens/vim-twig'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hdima/python-syntax', { 'for': 'python' }
"" Updated sass/scss syntax
Plug 'tpope/vim-haml'

"" Custom TextObjects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'lucapette/vim-textobj-underscore'

let s:localFile = expand("~/.local.vimplugins.vim")
if filereadable(s:localFile)
  exec 'source '.fnameescape(s:localFile)
endif

call plug#end()

Plugin 'gmarik/Vundle.vim'

" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-vinegar'
" Plugin 'rizzatti/dash.vim'
" Plugin 'tpope/vim-sensible'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/matchit.zip'
Plugin 'rking/ag.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'Raimondi/delimitMate'
"Plugin 'vim-scripts/simple-pairs'
Plugin 'sjl/gundo.vim'

" Javascript Functionallity
Plugin '29decibel/vim-stringify'
Plugin 'heavenshell/vim-jsdoc'

"Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/yajs.vim'

" Color Schemas
Plugin 'chriskempson/base16-vim'
Plugin 'jonathanpatt/vim-koala'

"" Syntaxes
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'dansomething/ftl-vim-syntax'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'elzr/vim-json'
Plugin 'evidens/vim-twig'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
" Vim Velocity Plugin
" Plugin 'lepture/vim-velocity'

" Plugin 'pangloss/vim-javascript'
Plugin 'hdima/python-syntax'

"" Updated sass/scss syntax
Plugin 'tpope/vim-haml'

"" Custom TextObjects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'beloglazov/vim-textobj-quotes'
Plugin 'lucapette/vim-textobj-underscore'

" Location List
" Plugin 'Valloric/ListToggle'
" Plugin 'marijnh/tern_for_vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'

let s:localFile = expand("~/.local.vimplugins.vim")
if filereadable(s:localFile)
  exec 'source '.fnameescape(s:localFile)
endif


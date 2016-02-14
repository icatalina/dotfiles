" History & Undo Level
set history=1000
set undolevels=1000

try
  let $VIMUNDODIR = $VIMTEMP."/_vimundodir"
  call CreateIfNotExist($VIMUNDODIR)
  set undodir=$VIMUNDODIR
  set undofile
catch
endtry

" NeoVim uses a different info file
if has('nvim')
  set viminfo+=n$VIMTEMP/_nviminfo
else
  set viminfo+=n$VIMTEMP/_viminfo
endif

try
  let $VIMSWPDIR = $VIMTEMP."/_vimswp"
  call CreateIfNotExist($VIMSWPDIR)
  set backupdir=$VIMSWPDIR
  set directory=$VIMSWPDIR
catch
  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endtry

set backupskip=/tmp/*,/private/tmp/*
set backup
set writebackup




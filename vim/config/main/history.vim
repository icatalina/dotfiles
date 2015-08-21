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

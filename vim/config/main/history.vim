" History & Undo Level
set history=700
set undolevels=700

try
	let $VIMUNDODIR = $VIMTEMP."/_vimundodir"
    call CreateIfNotExist($VIMUNDODIR)
    set undodir=$VIMUNDODIR
    set undofile
catch
endtry

" Remove Trailing WhiteSpaces
function! TrimTrailingWhitespace()
    " don't lose user position when trimming trailing whitespace
    let savedPos = winsaveview()
    try
        %s/\s\+$//e
    finally
        call winrestview(savedPos)
    endtry
endfunction

" Inserts a new line
" Inputs: "up" or "down"
" If no input is specified, down is assumed
function! InsertNewLine(...)
    let g:cursor=getpos(".")

    if a:0 > 0 && a:1 == 'up'
        let l:command=':i.'
        let g:cursor[1] = g:cursor[1] + 1
    elseif a:0 == 0 || (a:0 > 0 && a:1 == 'down')
       let l:command=':a.'
    else
        return
    endif

    try
        exec "normal " . l:command
    finally
        keepjumps call setpos(".", g:cursor)
    endtry

endfunction

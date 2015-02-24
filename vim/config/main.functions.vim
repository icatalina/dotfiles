function! TrimTrailingWhitespace()
    " don't lose user position when trimming trailing whitespace
    let savedPos = winsaveview()
    try
        %s/\s\+$//e
    finally
        call winrestview(savedPos)
    endtry
endfunction


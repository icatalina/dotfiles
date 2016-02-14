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

" Adds the quicklist items to the Argslist
function! QuickListToArgs()
  let l:list = {}
  let l:ouptut = ''

  exe 'silent! argd *'

  for file in getqflist()
    let l:list[bufname(file.bufnr)] = 1
  endfor

  let l:output = join(keys(l:list))
  let g:output = join(keys(l:list))

  exe 'silent! arga' l:output
  exe 'silent! cclose'
  exe 'args'
endfunction

" Meassure file size and disable some stuff if too big
function! LongFiles()
    let l:long = max(map(getline(1,'$'), 'len(v:val)'))
    if l:long > 300
        echo 'File with long lines (' . l:long . 'chars), disabling some stuff...'
        setlocal noautoindent nocindent nosmartindent indentexpr=
        setlocal syntax=OFF
    endif
endfunction

"
" Times the number of times a particular command takes to execute the specified number of times (in seconds).
function! HowLong( command, numberOfTimes )
  " We don't want to be prompted by a message if the command being tried is
  " an echo as that would slow things down while waiting for user input.
  let more = &more
  set nomore
  let startTime = localtime()
  for i in range( a:numberOfTimes )
    execute a:command
  endfor
  let result = localtime() - startTime
  let &more = more
  return result
endfunction

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    else
        call cursor(1,1)
    endif
endfunction

function! CreateIfNotExist(dir)
    if(!isdirectory(a:dir))
        execute "silent !mkdir -p \"" . a:dir . "\" >> /dev/null 2>&1"
    endif
endfunction

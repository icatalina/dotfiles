let g:NeatStatusLine_color_normal   = 'guifg=#000000 guibg=#7dcc7d gui=NONE ctermfg=0 ctermbg=2'
" White on Red
let g:NeatStatusLine_color_insert   = 'guifg=#ffffff guibg=#ff0000 gui=bold ctermfg=15 ctermbg=darkyellow'
" Yellow on Blue
let g:NeatStatusLine_color_replace  = 'guifg=#ffff00 guibg=#5b7fbb gui=bold ctermfg=yellow ctermbg=blue'
" White on Purple
let g:NeatStatusLine_color_visual   = 'guifg=#ffffff guibg=#810085 gui=NONE ctermfg=15 ctermbg=53'
" White on Black
let g:NeatStatusLine_color_position = 'guifg=#ffffff guibg=#000000 ctermfg=15 ctermbg=0'
" White on Pink
let g:NeatStatusLine_color_modified = 'guifg=#ffffff guibg=#ff00ff ctermfg=darkyellow ctermbg=19'
" Pink on Black
let g:NeatStatusLine_color_line     = 'guifg=#ff00ff guibg=#000000 gui=bold ctermfg=black ctermbg=red'
" Black on Cyan
let g:NeatStatusLine_color_filetype = 'guifg=#000000 guibg=#00ffff gui=bold ctermfg=0 ctermbg=51'

let g:NeatStatusLine_separator = '|'

function! Mode()
    redraw
    let l:mode = mode()

    if     mode ==# "n"  | exec 'hi User1 '.g:NeatStatusLine_color_normal  | return "NORMAL"
    elseif mode ==# "i"  | exec 'hi User1 '.g:NeatStatusLine_color_insert  | return "INSERT"
    elseif mode ==# "R"  | exec 'hi User1 '.g:NeatStatusLine_color_replace | return "REPLACE"
    elseif mode ==# "v"  | exec 'hi User1 '.g:NeatStatusLine_color_visual  | return "VISUAL"
    elseif mode ==# "V"  | exec 'hi User1 '.g:NeatStatusLine_color_visual  | return "V-LINE"
    elseif mode ==# "" | exec 'hi Useo $1 '.g:NeatStatusLine_color_visual  | return "V-BLOCK"
    else                 | return l:mode
    endif
endfunc

exec 'hi User2 '.g:NeatStatusLine_color_line
exec 'hi User3 '.g:NeatStatusLine_color_filetype
exec 'hi User4 '.g:NeatStatusLine_color_modified

"statusline setup
set statusline=
set statusline+=%1*\ %{Mode()}
set statusline+=%{&paste?'›PASTE':''}\ %0*
set statusline+=\ %-0.50f

"modified flag
set statusline+=%(%4*%m%)
set statusline+=%*
set statusline+=\ %(❪%{GetGitStatus()}❫%)

set statusline+=%=      "left/right separator

"display a warning if fileformat isnt unix
set statusline+=%2*
set statusline+=%([%R%H%{&ff!='unix'?','.&ff:''}%{(&fenc!='utf-8'&&&fenc!='')?','.&fenc:''}]%)
set statusline+=%3*
set statusline+=%([%{StatuslineTabWarning()}%{StatuslineTrailingSpaceWarning()}]%)

set statusline+=%*
set statusline+=%y  "filetype

set statusline+=%*

set statusline+=%([%3v]%)  "cursor column

set laststatus=2


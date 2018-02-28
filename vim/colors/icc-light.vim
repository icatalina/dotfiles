set background=light
set termguicolors

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "icc"

" black:         #1a1a1a
" red:           #bb0900
" green:         #28b238
" yellow:        #c1a700
" blue:          #0066ff
" magenta:       #b10dc9
" cyan:          #00a4e4
" white:         #aaaaaa
" lightblack:    #7c7c7c
" lightred:      #ff4136
" lightgreen:    #5eda6c
" lightyellow:   #ffdc00
" lightblue:     #0066ff
" lightmagenta:  #db40f3
" lightcyan:     #7fdbff
" lightwhite:    #ffffff

" General colors
hi Normal guifg=#1a1a1a guibg=NONE gui=none
hi Cursor guifg=#1a1a1a guibg=#eae788 gui=none

hi Visual guifg=NONE guibg=#f4f4f4 gui=none
hi IncSearch guifg=#f9f9fb guibg=#0066ff gui=none cterm=NONE
hi Search guifg=#bb0900 guibg=#ffdc00 gui=none
hi Title guifg=#c1a700 gui=bold

hi StatusLine guifg=#ffffff guibg=#5e5e5e gui=none cterm=NONE term=NONE
hi StatusLineNC guifg=#a6a6a6 guibg=#f0f0f0 gui=none cterm=NONE
hi VertSplit guifg=#f0f0f0 guibg=#f0f0f0 gui=none

hi LineNr guibg=#fafafa guifg=#aaaaaa gui=none cterm=NONE term=NONE
hi SpecialKey guifg=#aaaaaa guibg=NONE gui=reverse
hi WarningMsg guifg=#e06900
hi ErrorMsg guifg=#f9f9fb guibg=#bb0900 gui=NONE

hi CursorLine guibg=#f9f9fb gui=NONE cterm=NONE
hi CursorLineNr guifg=#f9f9fb guibg=#96928f
hi CursorColumn guibg=#f9f9fb gui=NONE cterm=NONE
hi! link CursorColumn CursorLine
hi! link ColorColumn CursorColumn

hi MatchParen guifg=NONE guibg=#cad1d9 gui=bold
hi Pmenu guifg=#0f368a guibg=#f1f5fd
hi PmenuSel guifg=#f1f5fd guibg=#0f368a
hi PmenuSbar guifg=#f1f5fd guibg=#d1defa
hi PmenuThumb guifg=#759cf0 guibg=#759cf0

" Syntax highlighting
hi Keyword guifg=#0066ff gui=none
hi Statement guifg=#d600a4 gui=bold
hi Constant guifg=#bb0900 gui=none
hi Number guifg=#bb0900 gui=none
hi PreProc guifg=#bb0900 gui=none
hi Function guifg=#3f831e gui=none
hi Identifier guifg=#3f831e gui=none
hi Type guifg=#3f831e gui=none
hi Special guifg=#0066ff gui=none
hi String guifg=#E06900 gui=none
hi Comment guifg=#96928f gui=none
hi Todo guifg=#ffdc00 guibg=#1a1a1a gui=none

hi WildMenu guifg=#f9f9fb guibg=#0066ff

" Links
hi Folded guifg=#595959 guibg=#f0f0f0 gui=NONE
hi! link FoldColumn Folded

hi User1 guifg=#f9f9fb guibg=#bb0900
hi User2 guifg=#f9f9fb guibg=#3f831e

hi DiffAdd    guibg=#e6f2e3
hi DiffChange guibg=#fff9d0
hi DiffDelete guibg=#ffdcda
hi DiffText   guibg=#ffdc00 guifg=#1a1a1a cterm=NONE

hi SpellBad   guifg=NONE guifg=#bb0900 cterm=underline
hi! link SpellCap SpellBad
hi! link SpellRare SpellBad
hi! link SpellLocal SpellBad

hi NonText guibg=NONE guifg=#dddddd
hi! link cssBraces Normal

set colorcolumn=80

colorscheme icc

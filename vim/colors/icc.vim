set background=light
set termguicolors

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "icc"

let g:colors = {
      \ 'red':          '#c20000',
      \ 'green':        '#3e821e',
      \ 'yellow':       '#ffdc00',
      \ 'light_red':    '#ffdcda',
      \ 'light_green':  '#e6f2e3',
      \ 'light_yellow': '#fff9d0',
      \ 'orange':       '#bd7112',
      \ 'blue':         '#398bc9',
      \ 'purple':       '#af33a6',
      \ 'magenta':      '#af33a6',
      \ 'cyan':         '#ff0000',
      \ 'gray1':        '#f4f4f4',
      \ 'gray2':        '#f9f9fb',
      \ 'gray3':        '#dddddd',
      \ 'gray4':        '#aaaaaa',
      \ 'gray5':        '#cad1d9',
      \ 'gray6':        '#928E8B',
      \ 'foreground':   '#1a1a1a',
      \ 'background':   '#ffffff',
      \ 'none':         'NONE',
      \ 'bold':         'BOLD',
      \ 'under':        'UNDERLINE',
      \ 'reverse':      'REVERSE',
      \ 'italic':       'ITALIC',
      \ }

let g:colors_dark = {
      \ 'red':          '#FF7575',
      \ 'light_red':    '#ffdcda',
      \ 'green':        '#75FF85',
      \ 'light_green':  '#e6f2e3',
      \ 'yellow':       '#ffe014',
      \ 'light_yellow': '#fff9d0',
      \ 'orange':       '#FF9538',
      \ 'blue':         '#80C4FF',
      \ 'magenta':      '#e785ff',
      \ 'cyan':         '#ff0000',
      \ 'gray1':        '#292929',
      \ 'gray2':        '#252525',
      \ 'gray3':        '#4a4a4a',
      \ 'gray4':        '#808080',
      \ 'gray5':        '#505050',
      \ 'gray6':        '#96928f',
      \ 'foreground':   '#ffffff',
      \ 'background':   '#1a1a1a',
      \ 'none':         'NONE',
      \ 'bold':         'BOLD',
      \ 'under':        'UNDERLINE',
      \ 'reverse':      'REVERSE',
      \ }

function! SetColor(key, config)
  let l:command = 'hi ' . a:key

  if (has_key(a:config, 'fg'))
    let l:command = l:command . ' guifg=' . g:colors[a:config.fg]
  endif
  if (has_key(a:config, 'bg'))
    let l:command = l:command . ' guibg=' . g:colors[a:config.bg]
  endif
  if (has_key(a:config, 'text'))
    let l:command = l:command . ' gui=' . g:colors[a:config.text]
    let l:command = l:command . ' cterm=' . g:colors[a:config.text]
  endif

  exec l:command
endfunction

" General colors
let highlights = {
  \ 'Normal':       { 'fg': 'foreground', 'bg': 'background' },
  \ 'Cursor':       { 'fg': 'foreground', 'bg': 'none' },
  \ 'Visual':       { 'fg': 'none',       'bg': 'gray1', 'text': 'none' },
  \ 'IncSearch':    { 'fg': 'gray2',      'bg': 'blue', 'text': 'none' },
  \ 'Search':       { 'fg': 'red',        'bg': 'yellow', 'text': 'none' },
  \ 'Title':        { 'fg': 'red',        'text': 'bold' },
  \ 'StatusLine':   { 'fg': 'foreground', 'bg': 'gray3', 'text': 'none' },
  \ 'StatusLineNC': { 'fg': 'gray4',      'bg': 'gray1', 'text': 'none' },
  \ 'VertSplit':    { 'fg': 'gray3',      'bg': 'gray3', 'text': 'none' },
  \ 'LineNr':       { 'fg': 'gray4',      'bg': 'gray2', 'text': 'none' },
  \ 'SpecialKey':   { 'fg': 'gray4', 'bg': 'none', 'text': 'reverse' },
  \ 'WarningMsg':   { 'fg': 'yellow' },
  \ 'ErrorMsg':     { 'fg': 'gray2', 'bg': 'red', 'text': 'none' },
  \ 'CursorLine':   { 'bg': 'none', 'text': 'none' },
  \ 'CursorLineNr': { 'fg': 'gray2', 'bg': 'gray6' },
  \ 'CursorColumn': { 'bg': 'gray2', 'text': 'none'},
  \ 'MatchParen':   { 'fg': 'none', 'bg': 'gray5', 'text': 'none' },
  \ 'Pmenu':        { 'fg': 'foreground', 'bg': 'gray1' },
  \ 'PmenuSel':     { 'fg': 'foreground', 'bg': 'blue' },
  \ 'Keyword':      { 'fg': 'foreground', 'text': 'none' },
  \ 'Statement':    { 'fg': 'magenta' },
  \ 'jsReturn':     { 'text': 'bold' },
  \ 'jsFunction':   { 'fg': 'gray5', 'text': 'none' },
  \ 'Constant':     { 'fg': 'foreground', 'text': 'none' },
  \ 'Number':       { 'fg': 'foreground', 'text': 'none' },
  \ 'PreProc':      { 'fg': 'foreground', 'text': 'bold' },
  \ 'jsExportDefault': { 'fg': 'green', 'text': 'bold' },
  \ 'Function':     { 'fg': 'green', 'text': 'bold' },
  \ 'Identifier':   { 'fg': 'foreground', 'text': 'none' },
  \ 'Type':         { 'fg': 'foreground', 'text': 'none' },
  \ 'Special':      { 'fg': 'foreground', 'text': 'none' },
  \ 'String':       { 'fg': 'orange', 'text': 'none' },
  \ 'Comment':      { 'fg': 'gray6', 'text': 'italic' },
  \ 'Todo':         { 'fg': 'yellow', 'bg': 'foreground', 'text': 'none' },
  \ 'WildMenu':     { 'fg': 'gray2', 'bg': 'blue' },
  \ 'Folded':       { 'fg': 'background', 'bg': 'blue', 'text': 'none' },
  \ 'User1':        { 'fg': 'gray2', 'bg': 'red', },
  \ 'User2':        { 'fg': 'gray2', 'bg': 'green' },
  \ 'DiffAdd':      { 'bg': 'light_green' },
  \ 'DiffChange':   { 'bg': 'light_yellow' },
  \ 'DiffDelete':   { 'bg': 'light_red' },
  \ 'DiffText':     { 'bg': 'yellow', 'fg': 'foreground', 'text': 'under' },
  \ 'SpellBad':     { 'fg': 'red', 'text': 'under' },
  \ 'NonText':      { 'bg': 'none', 'fg': 'gray3' },
  \ }

hi! link CursorColumn CursorLine
hi! link ColorColumn CursorColumn
hi! link Folded FoldColumn
hi! link SpellCap SpellBad
hi! link SpellRare SpellBad
hi! link SpellLocal SpellBad
hi! link cssBraces Normal
hi! link jsFuncParens Function

for key in keys(highlights)
  call SetColor(key, highlights[key])
endfor

set colorcolumn=80

colorscheme icc

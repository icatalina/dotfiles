"" Detect Indent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
let g:detectindent_max_lines_to_analyse = 1024
autocmd BufNewFile,BufReadPost * :DetectIndent

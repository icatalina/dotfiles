autocmd ColorScheme * highlight SyntasticError ctermbg=red  guibg=#960000
autocmd ColorScheme * highlight SyntasticWarning ctermbg=red guibg=#AEA100
autocmd ColorScheme * highlight SyntasticStyleError ctermbg=yellow guibg=#960000
autocmd ColorScheme * highlight SyntasticStyleWarning ctermbg=yellow guibg=#960000

highlight SyntasticErrorLine guibg=#2f0000


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" All errors together
let g:syntastic_aggregate_errors = 0

let g:syntastic_scss_checkers = ['sass', 'scss_lint']
let g:syntastic_javascript_checkers = ['eslint']
" Wether to use or not :sign to mark errors, to check on performance
let g:syntastic_enable_signs = 0

"@n \si > Syntastic Info
nmap <silent> \si :SyntasticInfo<CR>
"@n \st > Syntastic Toggle Mode
nmap <silent> \st :SyntasticToggleMode<CR>
"@n \sr > Syntastic Reset
nmap <silent> \sr :lex []<CR>:lw<CR>:SyntasticReset<CR>
"@n \ss > Syntastic Check
nmap <silent> \ss :SyntasticCheck<CR>
"@n \sS > Syntastic Check and Populate and Open the LocList
nmap <silent> \sS :SyntasticCheck<CR>:SyntasticSetLoclist<CR>:lw<CR>
"@n \sb > Syntastic Check and Populate and open the LocList and Reset Syntastic
nmap <silent> \sb :SyntasticCheck<CR>:SyntasticSetLoclist<CR>:SyntasticReset<CR>:lw<CR>

let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_error_symbol = '●'
let g:syntastic_style_error_symbol = '‣'
let g:syntastic_warning_symbol = '○'
let g:syntastic_style_warning_symbol = '▹'

autocmd BufNewFile,BufRead *.html
      \let g:syntastic_html_tidy_ignore_errors += ['<if-', 'discarding unexpected </if-', '<a> attribute "href" lacks value']

"syntastic settings
let syntastic_stl_format = '[Syntax: %E{line:%fe }%W{#W:%w}%B{ }%E{#E:%e}]'


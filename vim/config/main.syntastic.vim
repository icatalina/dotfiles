set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_scss_checkers = ['sass', 'scss_lint']
let g:syntastic_javascript_checkers = ['eslint']

nnoremap <silent> <leader>- :SyntasticCheck<CR>
nnoremap <silent> <leader>_ :SyntasticCheck<CR>:lopen<CR>
nnoremap <silent> _ :lprev<CR>
nnoremap <silent> - :lnext<CR>
nnoremap <silent> <leader>0 :lclose<CR>


setlocal nonumber
setlocal colorcolumn=
setlocal scrolloff=1                       " Minium number of lines above and below the cursor
setlocal sidescrolloff=1                  " Minium number of characters left and right of the cursor

nnoremap <buffer> <silent> q     :cclose<CR>
nnoremap <buffer> <silent> <C-C> :cclose<CR>
nnoremap <buffer> <silent> <C-^> :cclose<CR>
nnoremap <buffer> <silent> gf <CR>
nnoremap <buffer> <silent> <c-n> j
nnoremap <buffer> <silent> <c-p> k

setlocal nobuflisted!

wincmd J

autocmd BufEnter * if &filetype == 'qf' | silent! resize 10 | endif

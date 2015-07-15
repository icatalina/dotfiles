vnoremap <Leader>su :sort u<CR>
vnoremap <Leader>sa :sort<CR>
nnoremap <Leader>sr :%s/
vnoremap \/ <Esc>/\%V
vnoremap <Leader>sr <Esc>:%s/\%V

" Removes the previous searched string
nnoremap <silent> <Leader>sc :let @/ = ""<CR>
vnoremap <silent> <Leader>sc <c-c>:let @/ = ""<cr>v

" Save
nnoremap <C-z> :update<cr>
inoremap <C-z> <c-o>:update<cr>
vnoremap <C-z> <c-c>:update<cr>v

au BufEnter *buffergator-buffers* silent! nunmap ds
au BufLeave *buffergator-buffers* nmap   ds <Plug>Dsurround

" Remap ctrl+enter and ctrl+shift+enter to insert a line above and below the
" current line
nmap <silent> <C-CR> :call InsertNewLine()<CR>
nmap <silent> <C-S-CR> :call InsertNewLine('up')<CR>

" Remove Trailing spaces with cdw / Quick Update for whitespaces
nnoremap <silent> cdw :call TrimTrailingWhitespace()<CR>:AirlineToggleWhitespace<CR>:AirlineToggleWhitespace<CR>

" Advanced gf
nmap cgf :e <cfile><CR>

map <F7> :call QuickListToArgs()<CR>

nmap <silent> \r :set relativenumber!<CR>

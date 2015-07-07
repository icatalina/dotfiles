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

nnoremap <silent> <Leader>pp :CtrlP<CR>
nnoremap <silent> <Leader>pb :CtrlPBuffer<CR>
nnoremap <silent> <Leader>pm :CtrlPMRU<CR>

vnoremap <Leader>su :sort u<CR>
vnoremap <Leader>sa :sort<CR>
nnoremap <Leader>sr :%s/
vnoremap \/ <Esc>/\%V
vnoremap <Leader>sr <Esc>:%s/\%V

" Removes the previous searched string
nnoremap <silent> <Leader>sc :let @/ = ""<CR>
vnoremap <silent> <Leader>sc <c-c>:let @/ = ""<cr>v

"Location List
let g:lt_location_list_toggle_map = 'coo'
nmap coj :lnext<CR>
nmap cok :lprev<CR>

" QuickFix List
let g:lt_quickfix_list_toggle_map = 'cpp'
nmap cpj :cnext<CR>
nmap cpk :cnext<CR>

" Save
nnoremap <C-z> :update<cr>
inoremap <C-z> <c-o>:update<cr>
vnoremap <C-z> <c-c>:update<cr>v


" Toggle NerdTree
nnoremap <Leader>n :NERDTreeToggle<cr>
" Find in Nerd Tree
nmap <leader>m :NERDTreeFind<CR>

" nerd commenter
let g:nerdcreatedefaultmappings = 0
let nerdspacedelims = 1
nmap \c <Plug>NERDCommenterToggle
vmap \c <Plug>NERDCommenterToggle
map <F9> :normal \c<CR>
inoremap <F9> <c-o>:normal \c<CR>

au BufEnter *buffergator-buffers* silent! nunmap ds
au BufLeave *buffergator-buffers* nmap   ds <Plug>Dsurround

" Remap ctrl+enter and ctrl+shift+enter to insert a line above and below the
" current line
nmap <silent> <C-CR> :call InsertNewLine()<CR>
nmap <silent> <C-S-CR> :call InsertNewLine('up')<CR>

" Remove Trailing spaces with F5 / Quick Update for whitespaces
nnoremap <silent> cdw :call TrimTrailingWhitespace()<CR>:AirlineToggleWhitespace<CR>:AirlineToggleWhitespace<CR>

" BufferGator
nmap <silent> <Leader>b :BuffergatorToggle<CR>


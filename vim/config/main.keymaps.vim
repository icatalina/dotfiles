"vnoremap <unt> * :call VisualSelection('f')<cR>
"vnoremap <silent> # :call VisualSelection('b')<CR>
nnoremap <C-/> :let @/ = ""<CR>
inoremap <C-/> <C-O>:let @/ = ""<CR>
vnoremap <c-/> <c-c>:let @/ = ""<cr>v

nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <C-L> :CtrlPBuffer<CR>
nnoremap <silent> <C-K> :CtrlPMRU<CR>

" Sort
vnoremap <Leader>s :sort<CR>
" Unique
vnoremap <Leader>u :sort u<CR>

" Search and Replace
nnoremap <Leader># :%s/
vnoremap <Leader># <C-C>:s/\%V

"" MouseWheel
"" map <ScrollWheelUp> <C-Y>

nnoremap <C-,> :cprev<cr>
inoremap <C-,> <C-O>:cprev<cr>
vnoremap <C-,> <c-c>:cprev<cr>

nnoremap <C-.> :cnext<cr>
inoremap <C-.> <C-O>:cnext<cr>
vnoremap <C-.> <c-c>:cnext<cr>

noremap <Leader>e :bp<bar>sp<bar>bn<bar>bd<CR>
noremap <Leader>E :bp<bar>sp<bar>bn<bar>bd!<CR>
noremap <Leader>` :qa!<CR>

nnoremap <Leader>h  :tabprevious<CR>
nnoremap <leader>l  :tabnext<CR>
nnoremap <Leader>t  :tabnew<CR>
nnoremap <Leader>w  :tabclose<CR>

noremap <C-U> <C-R>

" Save
nnoremap <C-Z> :update<CR>
inoremap <C-Z> <C-O>:update<CR>
vnoremap <c-Z> <c-c>:update<CR>v

"vnoremap <unt> * :call VisualSelection('f')<cR>
"vnoremap <silent> # :call VisualSelection('b')<CR>

" Leader . removes the previous searched string
nnoremap <Leader>. :let @/ = ""<CR>
vnoremap <Leader>. <c-c>:let @/ = ""<cr>v

nnoremap <Leader>n :NERDTreeToggle<cr>
vnoremap <Leader>n <c-c><plug>NERDTreeToggle<cr>
nmap <leader>m :NERDTreeFind<CR>

" NERD Commenter
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle

" Remap ctrl+enter and ctrl+shift+enter to insert a line above and below the
" current line
nmap <C-CR> o<Esc>k
nmap <C-S-CR> O<Esc>j

nmap <F8> va":s/\%V"/'/g<CR>

nnoremap <leader>s :update<CR>

" Remove Trailing spaces with F5
nnoremap <silent> <F5> :call TrimTrailingWhitespace()<CR>

" Navigate the quickfix list
nnoremap <silent> <Leader>] :cnext<CR>
nnoremap <silent> <Leader>[ :cprev<CR>
nnoremap <silent> <Leader>+ :copen<CR>
nnoremap <silent> <Leader>= :cclose<CR>

nmap <silent> <F2> <Plug>DashSearch
nmap <silent> <Leader>i :MgrToggle


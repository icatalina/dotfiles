map <leader>R <C-W>R

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

"
"" Syntastic Check
nnoremap <silent><F1> :SyntasticCheck<CR>
inoremap <silent><F1> <C-O>:SyntasticCheck<CR>
vnoremap <silent><F1> :SyntasticCheck<CR>

"" MouseWheel
"" map <ScrollWheelUp> <C-Y>

nnoremap <Leader>n :NERDTree<cr>
inoremap <Leader>n <C-O>:NERDTree<cr>
vnoremap <Leader>n <c-c>:NERDTree<cr>

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

"Double slash removes the prevous search
nnoremap // :let @/ = ""<CR>
vnoremap // <c-c>:let @/ = ""<cr>v

nnoremap <Leader>n :NERDTreeTabsToggle<cr>
vnoremap <Leader>n <c-c><plug>NERDTreeTabsToggle<cr>
nmap <leader>m :NERDTreeFind<CR>

" NERD Commenter
map <leader>/ <plug>NERDCommenterToggle
imap <leader>/ <Esc><plug>NERDCommenterToggle

" Remap ctrl+enter and ctrl+shift+enter to insert a line above and below the
" current line
nmap <C-CR> o<Esc>k
nmap <C-S-CR> O<Esc>j

nmap <F8> va":s/\%V"/'/g<CR>

" Remove Trailing spaces with F5
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Remove Tabs with F6
nnoremap <silent> <F6> :let _s=@/<Bar>:%s/\t/    /g<Bar>:let @/=_s<Bar>:nohl<CR>

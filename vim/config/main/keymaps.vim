"@v <Leader>su > Unique Sort
vnoremap <Leader>su :sort u<CR>

"@v <Leader>su > Unique Sort
vnoremap <Leader>sU :sort u!<CR>

"@v <Leader>sa > Sort A-Z
vnoremap <Leader>sa :sort i<CR>

"@v <Leader>sA > Sort A-Z - Case Sensitive
vnoremap <Leader>sA :sort<CR>

"@v <Leader>sz > Sort Z-A
vnoremap <Leader>sz :sort! i<CR>

"@v <Leader>sZ > Sort Z-A - Case Sensitive
vnoremap <Leader>sz :sort!<CR>

"@n <Leader>sr > Search aand Replace
nnoremap <Leader>sr :%s/

"@v \/ > Search in Visual Selection
vnoremap \/ <Esc>/\%V

"@v <Leader>sr > Search aand Replace in Visual Selection
vnoremap <Leader>sr <Esc>:%s/\%V

"@n <C-L> > Clean last search
nnoremap <C-L> :let @/ = ""<CR><C-L>
"@i <C-L> > Clean last search
inoremap <C-L> <C-O>:let @/ = ""<CR>

"@n Y > Make Y consistent with D and C, yanking the rest of the line
nnoremap Y y$

"@n <C-Z> > Save only if modified
nnoremap <C-z> :update<cr>
"@i <C-Z> > Save only if modified
inoremap <C-z> <c-o>:update<cr>
"@v <C-Z> > Save only if modified
vnoremap <C-z> <c-c>:update<cr>v

"@i <C-6> > Esc and change to previous buffer
inoremap <C-^> <Esc>:b#<cr>

au BufEnter *buffergator-buffers* silent! nunmap ds
au BufLeave *buffergator-buffers* nmap   ds <Plug>Dsurround

"@ <C-J> > Inserts line above the current one
map <silent> <C-j> :call InsertNewLine('up')<CR>
"@ <C-K> > Inserts line below the current one
map <silent> <C-k> :call InsertNewLine()<CR>

"@n cdw > Remove Trailing Whitespaces
nnoremap <silent> cdw :call TrimTrailingWhitespace()<CR>

"@n cgf > Go to File that will create the file if it doesn't exist
nmap cgf :e <cfile><CR>


"@c WW > Forces save and mark for edit in perforce
command! WW :w!|:norm \pe<CR>

" Stringify
"
" Small plugin that turns your raw templates into concatenated
" strings.

"@n <Leader>g > Converts the line into concatenated strings, 'asdfasdf' + 'asdfasdfa'
nmap <leader>g :call Stringify()<CR>

"@v <Leader>g > Converts the Selection into concatenated strings, 'asdfasdf' + 'asdfasdfa'
vmap <leader>g :call Stringify()<CR>

"@n <C-D> > Generate JSDocs
nmap <silent> <C-d> <Plug>(jsdoc)

"@ <F1> > Relative Numbers
map <silent> <F1> :set relativenumber!<CR>
imap <silent> <F1> <c-o>:set relativenumber!<CR>

"@ <F2> > Paste Toggle
set pastetoggle=<F2>

"@n <F3> > Undo Tree (GundoToggle)
nnoremap <F3> :GundoToggle<CR>

"@ <F7> > Move the items in the QuickList to the ToArgs List
map <F7> :call QuickListToArgs()<CR>

"@ <F12> > Reload BASE16 and Redraw
imap <silent><F12> <c-o>:execute 'silent !source $BASE16_SHELL'<CR><c-o>:redr!<CR>
map <silent><F12> :execute 'silent !source $BASE16_SHELL'<CR>:redr!<CR>


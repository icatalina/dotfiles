" NERDCommenter
let g:nerdcreatedefaultmappings = 0
let g:nerdspacedelims = 1

let g:NERDCustomDelimiters = {
      \ 'javascript' : { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/' },
      \ 'javascript.jquery': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
    \ }

"@n \c > Toggle Line Comment NERDCommenter
nmap \c <Plug>NERDCommenterToggle
"@v \c > Toggle Line Comment in selected lines NERDCommenter
vmap \c <Plug>NERDCommenterToggle

"@ <F9> > Toggle Line Comment in any any NERDCommenter
map <F9> :normal \c<CR>
inoremap <F9> <c-o>:normal \c<CR>


" NERDTree
let g:NERDTreeBookmarksFile = $VIMTEMP."/_vimNerdTreeBookMarks"
let g:NERDTreeIgnore=['\.DS_Store$', '\.pyc', '__pycache__', '__init__.py']
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeMouseMode=1
let g:NERDTreeWinSize=30
let g:NERDTreeMinimalUI=1

"@n <Leader>n > Toggle NERDTree
nnoremap <Leader>n :NERDTreeToggle<cr>
" Find in Nerd Tree
"@n <Leader>M > Find current file in NERDTree
nmap <leader>m :NERDTreeFind<CR>

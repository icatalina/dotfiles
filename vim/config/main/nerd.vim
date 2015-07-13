let g:NERDTreeBookmarksFile = $VIMTEMP."/_vimNerdTreeBookMarks"
"  autocmd VimEnter * :NERDTreeTabsToggle
let NERDTreeIgnore=['\.DS_Store$']
let g:nerdtree_tabs_open_on_gui_startup=0

"if isdirectory(expand('%'))
    "let vimInitDir = expand('%')
"endif

"if (expand('%') == '' && exists('vimInitDir') &&  isdirectory(vimInitDir)) || isdirectory(expand('%'))
"    cd `=vimInitDir`
"    let g:nerdtree_tabs_open_on_gui_startup=1
"    let g:nerdtree_tabs_open_on_console_startup=1
"    autocmd VimEnter * bd
"endif



"" MAPPINGS

" NERDCommenter
let g:nerdcreatedefaultmappings = 0
let nerdspacedelims = 1
nmap \c <Plug>NERDCommenterToggle
vmap \c <Plug>NERDCommenterToggle
map <F9> :normal \c<CR>
inoremap <F9> <c-o>:normal \c<CR>

let g:NERDCustomDelimiters = {
      \ 'javascript' : { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/' },
      \ 'javascript.jquery': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
    \ }

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<cr>
" Find in Nerd Tree
nmap <leader>m :NERDTreeFind<CR>


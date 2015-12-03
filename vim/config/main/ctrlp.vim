"" CtrlP excluded folder
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]((.(git|hg|svn|sass-cache))|node_modules|target|min|tmpcss|reports)$',
 \ 'file': '\v\.(exe|so|dll|processed\.scss|css\.js|map)$',
 \ 'link': 'some_bad_symbolic_links',
 \ }

"Make CtrlP Use the CWD
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_cmd = 'CtrlPMRUFiles'


let g:ctrlp_prompt_mappings = {
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        [],
    \ 'ToggleType(1)':        ['<c-f>', '<c-p>', '<c-up>'],
    \ }

" MAPPINGS

"@n <Leader>pp > CtrlP - Fuzzy search Files
nnoremap <silent> <Leader>pp :CtrlP<CR>
"@n <Leader>pb > CtrlP - Fuzzy search Buffers
nnoremap <silent> <Leader>pb :CtrlPBuffer<CR>
"@n <Leader>pm > CtrlP - Fuzzy search Most Recent Files
"@n <C-P> > CtrlP - Fuzzy search Most Recent Files
nnoremap <silent> <Leader>pm :CtrlPMRU<CR>

" For Reference Only
"@ctrlp <F5> > Purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"@ctrlp <F7> > Purge the MRU List
"@ctrlp <C-F> > Cycle between modes [file, mru, buffer].
"@ctrlp <C-B> > Cycle between modes [file, mru, buffer] backwards.
"@ctrlp <C-P> > Cycle between modes [file, mru, buffer].
"@ctrlp <C-D> > to switch to filename only search instead of full path.
"@ctrlp <C-R> > to switch to regexp mode.
"@ctrlp <C-J> > Or Arrow Key to navigate Up the list
"@ctrlp <C-K> > Or Arrow Key to navigate Down the list
"@ctrlp <C-T> > To open in a new Tab
"@ctrlp <C-V> > To open in a new Vertical Split
"@ctrlp <C-X> > To open in a new Horizontal Split
"@ctrlp <C-N> > To select next string from prompt
"@ctrlp <C-P> > To select previous string from prompt
"@ctrlp <C-Y> > To create a new file and its parent directories.
"@ctrlp <C-Z> > To mark/unmark multiple files
"@ctrlp <C-O> > To open serveral files marked with <C-Z>

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
nnoremap <silent> <Leader>pp :CtrlP<CR>
nnoremap <silent> <Leader>pb :CtrlPBuffer<CR>
nnoremap <silent> <Leader>pm :CtrlPMRU<CR>

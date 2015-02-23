"" CtrlP excluded folder
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache)|node_modules|target$',
 \ 'file': '\v\.(exe|so|dll)$',
 \ 'link': 'some_bad_symbolic_links',
 \ }

"Make CtrlP Use the CWD
let g:ctrlp_working_path_mode = 'a'



" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" nnoremap K :!grep "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap \\ :Ag! -i<SPACE>
vnoremap \\ "zy:Ag! -i <C-r>=fnameescape(@z)<CR>

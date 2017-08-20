setlocal colorcolumn=51,73
setlocal textwidth=72
setlocal spell
setlocal iskeyword+=-

function! PreviousCommits(findstart, base)
  if a:findstart == 1
    return 0
  else
    let l:commit_list = systemlist('git log -500 --no-merges --pretty="%s" |  grep -E "[A-Z]+-\d+" | grep "^' . a:base . '"')
    let l:list = []
    for l:commit in l:commit_list[0:30]
      let l:elem = {}
      let l:elem.word=l:commit
      let l:elem.abbr=strpart(l:commit, 0, 80)

      if len(l:commit) > len(l:elem.abbr)
        let l:elem.abbr.='...'
      endif

      call add(l:list, l:elem)
    endfor
    return l:list
  endif
endfunction

setlocal completefunc=PreviousCommits

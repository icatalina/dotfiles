"============================================================================
"File:        css.vim
"Description: Syntax checking plugin for syntastic.vim using `csslint` CLI tool (http://csslint.net).
"Maintainer:  Ory Band <oryband at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"============================================================================

if exists('g:loaded_syntastic_css_csslint_checker')
    finish
endif
let g:loaded_syntastic_css_csslint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_css_csslint_GetLocList() dict
    call syntastic#log#deprecationWarn('csslint_options', 'css_csslint_args')

    let makeprg = self.makeprgBuild({ 'args_after': '--ignore=box-sizing,fallback-colors,box-model --warnings=important,overqualified-elements,display-property-grouping,bulletproof-font-face,compatible-vendor-prefixes,regex-selectors,errors,duplicate-background-images,duplicate-properties,empty-rules,selector-max-approaching,gradients,font-sizes,font-faces,floats,star-property-hack,outline-none,import,ids,underscore-property-hack,rules-count,qualified-headings,selector-max,shorthand,text-indent,unique-headings,universal-selector,unqualified-attributes,vendor-prefix,zero-units --errors=known-properties --format=compact' })    

    " Print CSS Lint's error/warning messages from compact format. Ignores blank lines.
    let errorformat =
        \ '%-G,' .
        \ '%-G%f: lint free!,' .
        \ '%f: line %l\, col %c\, %trror - %m,' .
        \ '%f: line %l\, col %c\, %tarning - %m,'.
        \ '%f: line %l\, col %c\, %m,'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'defaults': {'bufnr': bufnr("")} })

endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'css',
    \ 'name': 'csslint'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:

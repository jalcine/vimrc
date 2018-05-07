" File: 
" tweaks.vim
" Author: yourname
" Description: 
" Last Modified: April 10, 2018
"
func! jalcine#tweaks#init() abort
  let l:known_tweaks = [
        \ 'goyo',
        \ 'test',
        \ 'terminal'
        \ ]

  for l:tweak in l:known_tweaks()
    exec 'call jalcine#tweaks#' . l:tweak . '#init()'
  endfor
endfunc

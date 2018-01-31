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

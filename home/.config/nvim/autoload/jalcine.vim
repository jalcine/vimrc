" File:          jalcine.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Entry point for Neovim itself.
" Last Modified: August 24, 2017

let g:jalcine = {}

func! s:EnhanceInbuiltSearch() abort
  if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
  endif
endfunc

func! jalcine#launch() abort
  call <SID>EnhanceInbuiltSearch()

  let l:sectors = [
        \ 'augroups',
        \ 'mappings',
        \ 'plugins',
        \ 'lang',
        \ 'theme',
        \ ]

  for l:sector in l:sectors
    exe 'call jalcine#' . l:sector . '#setup()'
  endfor
endfunc

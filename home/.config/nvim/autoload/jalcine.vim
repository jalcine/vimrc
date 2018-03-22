" File:          jalcine.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Entry point for Neovim itself.
" Last Modified: August 24, 2017

func! s:EnhanceInbuiltSearch() abort " {{{
  if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
  endif
endfunc " }}}

func! jalcine#setup() abort " {{{
  call <SID>EnhanceInbuiltSearch()

  let l:sectors = [
        \ 'augroups',
        \ 'lang',
        \ 'plugins',
        \ 'mappings',
        \ 'theme',
        \ 'language_client',
        \ 'journal',
        \ 'tags',
        \ 'projections',
        \ ]

  for l:sector in l:sectors
    exe 'call jalcine#' . l:sector . '#setup()'
  endfor
endfunc " }}}

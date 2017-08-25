" File:          jalcine.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Entry point for Neovim itself.
" Last Modified: August 24, 2017

let g:jalcine = {}

func! jalcine#launch()
  let l:sectors = [
        \ 'plugins',
        \ 'augroups',
        \ 'theme',
        \ 'lang',
        \ ]

  for sector in l:sectors
    exe 'call jalcine#' . l:sector . '#setup()'
  endfor
endfunc

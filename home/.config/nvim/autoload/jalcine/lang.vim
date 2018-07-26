" File:          autoload/jalcine/lang.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Language setup support.
" Last Modified: October 18, 2017

func! jalcine#lang#setup()
  let g:jalcine.mappings['lang'] = {
        \ 'php': 'ph',
        \ 'python': 'py',
        \ }

  call jalcine#lang#python#setup()
  call jalcine#lang#php#setup()
endfunc

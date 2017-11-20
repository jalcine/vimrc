" File:          autoload/jalcine/lang.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Language setup support.
" Last Modified: October 18, 2017

let g:jalcine.mappings.lang = {
      \ 'php': 'ph',
      \ 'python': 'py'
      \ }

func! jalcine#lang#setup()
  call jalcine#lang#python#setup()
  call jalcine#lang#php#setup()
  call jalcine#lang#javascript#setup()
endfunc

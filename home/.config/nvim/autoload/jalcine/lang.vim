let g:jalcine.mappings.lang = {
      \ 'php': 'ph',
      \ 'python': 'py'
      \ }

func! jalcine#lang#setup()
  call jalcine#lang#python#setup()
  call jalcine#lang#php#setup()
  " TODO: Do some stuff.
endfunc

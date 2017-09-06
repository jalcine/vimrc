" File:          jalcine/autoload/lang/php.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Enhancements for working with blasted PHP.
" Last Modified: August 24, 2017

let g:jalcine.mappings.lang.php = 'lp'

func! s:ApplyCustomMappings() abort
  call jalcine#mappings#apply_bulk([
        \ ['e', 'call jalcine#lang#php#invoke("expandclass")<CR>'],
        \ ['s', 'call jalcine#lang#php#invoke("sortuse")<CR>'],
        \ ['u', 'call jalcine#lang#php#invoke("insertuse")<CR>'],
        \ ], {
        \ 'prefix': g:jalcine.mappings.lang.php
        \ })
endfunc

func! jalcine#lang#php#invoke(cmd) abort
  if     a:cmd ==# 'sortuse' | call PhpInsertUse()
  elseif a:cmd ==# 'expandclass' | call PhpExpandClass()
  elseif a:cmd ==# 'insertuse' | call PhpInsertUse()
  endif
endfunc

func! jalcine#lang#php#tweak() abort
  call <SID>ApplyCustomMappings()
endfunc

func! jalcine#lang#php#setup() abort
endfunc

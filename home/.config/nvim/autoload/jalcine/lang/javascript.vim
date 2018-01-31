" File:          jalcine/lang/javascript.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Jazz for JS.
" Last Modified: November 15, 2017

func! jalcine#lang#javascript#setup() abort
  let g:javascript_conceal_function       = "ƒ"
  let g:javascript_conceal_null           = "ø"
  let g:javascript_conceal_this           = "@"
  let g:javascript_conceal_return         = "⇚"
  let g:javascript_conceal_undefined      = "¿"
  let g:javascript_conceal_NaN            = "ℕ"
  let g:javascript_conceal_prototype      = "¶"
  let g:javascript_conceal_static         = "•"
  let g:javascript_conceal_super          = "Ω"
  let g:javascript_conceal_arrow_function = "⇒"

  if exists('g:ale_fixers')
    let g:ale_fixers['javascript'] = ['eslint']
  endif
endfunc

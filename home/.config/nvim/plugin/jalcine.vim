" File:          plugin/jalcine.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Entry point for my setup.
" Last Modified: November 29, 2017

let g:jalcine = {
      \ 'mappings': {}
      \ }

" {{{ Kick it off
if v:vim_did_enter
  call jalcine#setup()
else
  au VimEnter * call jalcine#setup()
endif
" }}}

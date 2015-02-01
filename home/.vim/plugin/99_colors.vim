" vim: set nospell:
" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: October 25, 2014

" We always use 256 colors.
let t_Co=256

func! jalcine#colors#go_dark()
  colorscheme distinguished
endfunc

func! jalcine#colors#go_light()
  colorscheme laederon
endfunc

set background=light
call jalcine#colors#go_light()


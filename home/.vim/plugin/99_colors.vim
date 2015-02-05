" vim: set nospell:
" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: October 25, 2014

" We always use 256 colors.
let t_Co=256

func! s:go_dark()
  colorscheme ubaryd
  let g:airline_theme='ubaryd'
endfunc

func! s:go_light()
  colorscheme laederon
  let g:airline_theme='laederon'
endfunc

set background=dark
call s:go_dark()

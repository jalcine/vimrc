" vim: set nospell:
" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: 2015-05-08 13:48:26 EDT

" We always use 256 colors.
let t_Co=256

func! s:modify_colors()
  hi Conceal ctermbg=NONE guibg=NONE
  "hi FoldColumn ctermbg=NONE guibg=NONE
  "hi NonText ctermbg=NONE
  "hi SignColumn ctermbg=NONE guibg=NONE
  hi LineNr ctermbg=NONE guibg=NONE ctermfg=240
  hi Folded ctermbg=NONE guibg=NONE
  hi Todo ctermbg=NONE guibg=NONE
  hi VertSplit ctermbg=NONE guibg=NONE
  hi Split ctermbg=NONE guibg=NONE
  hi Special ctermbg=NONE guibg=NONE
endfunc

func! s:go_dark()
  colorscheme molokai
  let g:airline_theme='hybrid'
endfunc

func! s:go_light()
  colorscheme laederon
  set background=light
  let g:airline_theme='laederon'
endfunc

call s:go_dark()
call s:modify_colors()

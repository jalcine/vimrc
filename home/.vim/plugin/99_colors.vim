" vim: set nospell:
" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: October 25, 2014

" We always use 256 colors.
let t_Co=256

func! s:modify_colors()
  hi Conceal ctermbg=NONE guibg=NONE
  hi FoldColumn ctermbg=NONE guibg=NONE
  hi SignColumn ctermbg=NONE guibg=NONE
  hi Folded ctermbg=NONE guibg=NONE
  hi Todo ctermbg=NONE guibg=NONE
  hi VertSplit ctermbg=NONE guibg=NONE
  hi Split ctermbg=NONE guibg=NONE
  "hi Normal ctermbg=NONE
  hi NonText ctermbg=NONE ctermfg=black
endfunc

colorscheme jellybeans
call s:modify_colors()

" TODO: Add an editor command to handle swapping colors.

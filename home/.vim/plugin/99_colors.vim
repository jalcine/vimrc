" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: October 25, 2014

" We always use 256 colors.
set t_Co=256

" {{{ Loading and tweaking of colorscheme
colorscheme badwolf
hi Folded ctermbg=NONE
hi NonText ctermbg=NONE
"hi Normal ctermbg=NONE
hi VertSplit ctermbg=NONE
hi Todo ctermfg=5
hi Conceal ctermbg=NONE
hi LineNr ctermbg=NONE ctermfg=242
hi SignColumn ctermbg=NONE
" }}}

" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: October 25, 2014

" We always use 256 colors.
set t_Co=256

"let g:bas16colorspace=256

" {{{ Loading and tweaking of colorscheme
colorscheme jellybeans
hi FoldColumn ctermbg=black
" }}}

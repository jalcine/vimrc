" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: October 25, 2014

" We always use 256 colors.
set t_Co=256

" {{{ Options for Colorscheme
let g:badwolf_darkgutter=1
let g:badwolf_tabline=1
let g:badwolf_css_props_highlight=1
let g:badwolf_html_link_underline=1
" }}}

" {{{ Loading and tweaking of colorscheme
colorscheme badwolf
hi Normal  ctermbg=NONE
hi NonText ctermbg=NONE
hi Folded  ctermbg=None
hi LineNr  ctermbg=NONE
hi FoldColumn ctermbg=NONE
" }}}

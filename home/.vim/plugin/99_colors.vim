" File:          plugin/99_colors.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Source of trust when it comes to colors in Vim.
" Last Modified: October 25, 2014

" We always use 256 colors.
set t_Co=256
set background=dark

" {{{ Loading and tweaking of colorscheme
colorscheme base16-harmonic16
hi Constant ctermfg=4
hi Number ctermfg=4
hi Float ctermfg=4
hi Boolean ctermfg=4
hi link javascriptNumber Number
hi link markdownError Error
hi markdownUrl term=underline
hi Folded ctermbg=NONE
"hi NonText ctermbg=NONE
"hi Normal ctermbg=NONE
"hi VertSplit ctermbg=NONE
"hi Todo ctermfg=5
"hi Conceal ctermbg=NONE
"hi LineNr ctermbg=NONE ctermfg=242
"hi SignColumn ctermbg=NONE
"hi StatusLine ctermbg=black ctermfg=white
" }}}

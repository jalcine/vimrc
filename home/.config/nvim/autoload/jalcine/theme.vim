" File:          autoload/theme.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: December 11, 2017

func! jalcine#theme#setup() abort
  source ~/.vimrc_background
endfunc

function! jalcine#theme#customize() abort
  call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
  AirlineRefresh
endfunction

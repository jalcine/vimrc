" File:          autoload/theme.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: December 11, 2017

func! jalcine#theme#setup() abort
  source ~/.vimrc_background
  hi link Normal LineNr
  hi link Normal SignColumn
  hi link Normal SignifySignAdd
  hi link Normal SignifySignChange
  hi link Normal SignifySignDelete
  hi link Normal SignifySignChangeDelete
  hi link Normal SignifySignDeleteFirstLine
endfunc

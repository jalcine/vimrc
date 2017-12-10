" File:          autoload/projections.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Options for projections.
" Last Modified: December 04, 2017

func! jalcine#projections#setup() abort
  " TODO: Define some heuristics here.
  let g:projectionist_heuristics = {
        \ "README.*": { "type": "doc" },
        \ }
endfunc

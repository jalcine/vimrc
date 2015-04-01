" File: plugin/14_tags.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: 
" Last Modified: August 03, 2014

set tags=./tags,./TAGS
if isdirectory('~/.tags')
  let tagfiles = glob('**/*.tags', 0, 1)
  for atagfile in tagfiles
    let &tags .= ',' . fnamemodify(atagfile,':p:.')
  endfor
endif


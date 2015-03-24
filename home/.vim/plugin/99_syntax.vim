" File: plugin/99_syntax.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: Additions to syntax that I sorely need.
" Last Modified: October 26, 2014

" TODO: Add custom list of TODO highlighters in comments.

syn keyword jalcineTodo 
      \ NOTE FIXME BUG DONE
      \ contained

highlight notesDoubleQuoted gui=italic
hi link jalcineTodo TODO
hi link jalcineTodo Todo
hi link jalcineTodo rubyTodo

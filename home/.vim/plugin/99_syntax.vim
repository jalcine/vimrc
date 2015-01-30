" File: plugin/99_syntax.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: Additions to syntax that I sorely need.
" Last Modified: October 26, 2014

syn match myTodo contained "\<\(TODO\|FIXME\|NOTE\|BUG\):"
hi def link myTodo Todo
hi def link myTodo cTodo

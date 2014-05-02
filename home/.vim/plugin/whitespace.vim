" File:          plugin/whitespace.vim
" Author:        Jacky Alciné <me@jalcine.me>
" Description:   Helps with different project types.
" Last Modified: April 30, 2014


" Some projects, like C++, should be done with tabs.
augroup jalcine_whitespace
  au!
  au FileType cpp,javascript         setlocal noexpandtab
  au FileType ruby,python,sass,less  setlocal expandtab
  au FileType ruby,sass,less         setlocal shiftwidth=2 tabstop=2 softtabstop=2
  au FileType python,cpp,javascript  setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

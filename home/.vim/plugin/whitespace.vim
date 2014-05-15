" File:          plugin/whitespace.vim
" Author:        Jacky Alciné <me@jalcine.me>
" Description:   Helps with different project types.
" Last Modified: April 30, 2014


" Some projects, like C++, should be done with tabs.
augroup jalcine_whitespace
  au!
  au FileType cpp,javascript         setl noexpandtab
  au FileType ruby,python,sass,less  setl et 
  au FileType python                 setl sw=2 ts=2 sts=2
  au FileType ruby,sass,less         setl sw=2 ts=2 sts=2
  au FileType python,cpp,javascript  setl sw=2 ts=2 sts=2
  au FileType vim,tmux               setl sw=2 ts=2 sts=2 et
augroup END

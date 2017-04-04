" File: jalcine/projects.vim
" This does some extra work projects.

func! jalcine#projects#open(dir) abort
  tabnew
  tchdir a:dir
  FzfGFiles
endfunc

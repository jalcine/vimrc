func! jalcine#tweaks#terminal#adapt() abort
  setl noruler nocursorcolumn nocursorline norelativenumber nonumber
  setl signcolumn=no foldcolumn=0
endfunc

func! jalcine#tweaks#terminal#kill_extra_buffers() abort
  silent! TagbarClose
  silent! MerginalClose
  silent! cclose
  silent! lclose
  silent! bd Merginal:branchList
endfunc

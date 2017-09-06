func! jalcine#projects#open_new(dir) abort
  tabnew

  let l:doc_files = ['README.md', 'README.markdown', 'README']
  for l:doc_file in l:doc_files
    if exists(l:doc_file)
      exec('edit ' . l:doc_file)
      break
    endif
  endfor

  DotEnv | DirenvExport | TagbarOpenAutoClose
  call jalcine#projects#enter(a:dir)
endfunc

func! jalcine#projects#enter(dir) abort
  exec('tchdir ' . a:dir . ' | lchdir ' . a:dir)
  exec('FzfGFiles ' . a:dir)
endfunc

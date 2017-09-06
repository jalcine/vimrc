func! jalcine#projects#open_new(dir) abort
  tabnew
  exec('tchdir ' . a:dir)
  exec('lchdir ' . a:dir)
  Tagbar
  Dotenv

  let l:doc_files = ['README.md', 'README.markdown', 'README']
  for l:doc_file in l:doc_files
    if exists(l:doc_file)
      exec('edit ' . l:doc_file)
      break
    endif
  endfor

  call jalcine#projects#enter_directory(a:dir)
  exec('FzfGFiles ' . a:dir)
  TagbarOpen
endfunc

func! jalcine#projects#enter_directory(dir) abort
  exec('tchdir ' . a:dir)
endfunc

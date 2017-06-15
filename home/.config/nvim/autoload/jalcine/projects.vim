" File: jalcine/projects.vim
" Description: Make working with projects easier.
"
" The goal of this is to encapsulate some repetitive actions I take when I'm
" working on code.
"
" TODO: Write out a way to open up a new project in a tab.

func! jalcine#projects#open_new(dir) abort
  tabnew
  exec("tchdir " . a:dir)
  exec("lchdir " . a:dir)
  Tagbar
  NERDTreeTabsOpen

  let l:doc_files = ['README.md', 'README.markdown', 'README']
  for doc_file in l:doc_files
    if exists(doc_file)
      exec("edit " . l:doc_file)
      break
    endif
  endfor

  call jalcine#projects#enter_directory(a:dir)
  exec('FzfGFiles ' . a:dir)
  TagbarOpen
endfunc

func! jalcine#projects#show_initial_view() abort
    Startify | TagbarOpen
    NERDTreeTabsOpen
    Tagbar
    wincmd w
endfunc

func! jalcine#projects#enter_directory(dir) abort
  exec('tchdir ' . a:dir)
  exec(':NERDTreeFind | :NERDTreeCWD | :NERDTreeFocus')
endfunc

func! search#all_files()
  FzfFiles
endfunc

func! search#buffers()
  FzfBuffers
endfunc

func! search#tags()
  FzfTags
endfunc

func! search#history()
  FzfHistory
endfunc


command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

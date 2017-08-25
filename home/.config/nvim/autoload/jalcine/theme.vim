func! jalcine#theme#setup()
  let base16colorspace=256
  if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
  else
    colorscheme base16-pop
    AirlineRefresh
  endif
endfunc

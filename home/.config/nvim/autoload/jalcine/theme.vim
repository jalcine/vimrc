func! jalcine#theme#setup()
  let base16colorspace=256
  set termguicolors
  if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
  else
    AirlineTheme base16_default
    colorscheme base16-default-dark
  endif
endfunc

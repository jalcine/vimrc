func! color#tweak()
  hi Normal ctermbg=NONE
  hi NonText ctermbg=NONE
endfunc

func! color#apply()
  if has("termguicolors")
    set termguicolors
  endif
  set t_Co=256
  let g:airline_theme = 'bubblegum'
  colorscheme bubblegum
  set background=dark
  call color#tweak()
  AirlineRefresh
endfunc

au VimEnter * call color#apply()

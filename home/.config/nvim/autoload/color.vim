func! color#tweak()
  hi notesDoubleQuoted gui=italic cterm=italic
  hi notesSingleQuoted gui=italic cterm=italic
  hi notesBold cterm=bold
  hi notesItalic cterm=italic
  hi VertSplit ctermbg=NONE
  hi Split ctermbg=NONE
  hi Conceal ctermbg=NONE
  hi Folded ctermbg=NONE
  hi LineNr ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi SignColumn ctermbg=NONE
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

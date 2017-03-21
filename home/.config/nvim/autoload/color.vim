func! color#tweak() abort
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
  " hi Normal ctermbg=NONE
  " hi NonText ctermbg=NONE
endfunc

func! color#apply() abort
  if has("termguicolors")
    set termguicolors
  endif
  set t_Co=256
  colorscheme Tomorrow-Night-Bright
  set background=dark
  AirlineTheme tomorrow
  call color#tweak()
endfunc

func! color#bind() abort
  call color#apply()
  call color#tweak()
endfunc

func! jalcine#color#tweak() abort
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

func! jalcine#color#apply() abort
  colorscheme bubblegum-256-dark
  call airline#switch_theme('bubblegum')
  set background=dark
endfunc

func! jalcine#color#setup() abort
  call jalcine#color#apply()
endfunc

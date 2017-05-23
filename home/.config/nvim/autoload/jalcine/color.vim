func! jalcine#color#tweak() abort
  hi notesDoubleQuoted gui=italic cterm=italic
  hi notesSingleQuoted gui=italic cterm=italic
  hi notesBold cterm=bold gui=bold
  hi notesItalic cterm=italic gui=italic
  hi VertSplit ctermbg=NONE guibg=NONE
  hi Split ctermbg=NONE guibg=NONE
  hi Conceal ctermbg=NONE guibg=NONE
  hi Folded ctermbg=NONE guibg=NONE
  hi LineNr ctermbg=NONE guibg=NONE
  hi FoldColumn ctermbg=NONE guibg=NONE
  hi SignColumn ctermbg=NONE guibg=NONE
  hi Normal ctermbg=NONE guibg=NONE
  hi NonText ctermbg=NONE guibg=NONE
endfunc

func! jalcine#color#apply() abort
  colorscheme badwolf
  call airline#switch_theme('badcat')
  set background=dark
endfunc

func! jalcine#color#setup() abort
  call jalcine#color#apply()
  call jalcine#color#tweak()
endfunc

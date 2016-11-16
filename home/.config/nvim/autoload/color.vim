func! color#tweak()
  hi notesDoubleQuoted gui=italic cterm=italic
  hi notesSingleQuoted gui=italic cterm=italic
  hi notesBold cterm=bold
  hi notesItalic cterm=italic
  hi VertSplit ctermbg=NONE
  hi Split ctermbg=NONE
  hi Conceal ctermbg=NONE
  hi Normal ctermbg=NONE
  hi Folded ctermbg=NONE
  hi LineNr ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi SignColumn ctermbg=NONE
endfunc

func! color#apply()
  if has("termguicolors")
    set termguicolors
  endif
  let g:quantum_black = 1
  let g:quantum_italics = 1
  let g:airline_theme = 'quantum'
  set background=dark
  colorscheme quantum
  call color#tweak()
endfunc

au VimEnter * call color#apply()

func! color#tweak()
  hi notesDoubleQuoted gui=italic cterm=italic
  hi notesSingleQuoted gui=italic cterm=italic
  hi notesBold cterm=bold
  hi notesItalic cterm=italic
  hi VertSplit ctermbg=NONE
  hi Split ctermbg=NONE
  hi Conceal ctermbg=NONE
  hi Folded ctermbg=NONE
  hi SignColumn ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi LineNr ctermfg=7 ctermbg=NONE
  hi Comment ctermbg=NONE
  hi NonText ctermbg=NONE
endfunc

au VimEnter * colorscheme hybrid | set bg=dark | call color#tweak()

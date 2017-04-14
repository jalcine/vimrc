" File: jalcine/config.vim
" This has options that I tend to use on different machines a lot (like macOS
" and Linux).

func! jalcine#config#apply() abort
  if xolox#misc#os#is_mac()
    call jalcine#config#for_macosx()
  else " I don't run Neovim on anything else, so this has to be Linux.
    call jalcine#config#for_linux()
  endif
endfunc

func! jalcine#config#for_linux() abort
  " TODO: Figure out Linux (KDE, Ubuntu) specific options.
endfunc

func! jalcine#config#for_macosx() abort
  " TODO: Figure out macOS-specifically useful options.
endfunc

" au VimEnter call jalcine#config#apply()

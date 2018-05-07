func! jalcine#tweaks#terminal#adapt() abort
  setl noruler nocursorcolumn nocursorline norelativenumber nonumber
  setl signcolumn=no foldcolumn=0
endfunc

func! jalcine#tweaks#terminal#kill_extra_buffers() abort
  silent! TagbarClose
  silent! MerginalClose
  silent! cclose
  silent! lclose
  silent! bd Merginal:branchList
endfunc

func! jalcine#tweaks#terminal#update_colors() abort
  " :h term-dependent-settings
  if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
    set notermguicolors
  elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
    set termguicolors
  elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
    if $XTERM_VERSION != ''
      set termguicolors
    elseif $KONSOLE_PROFILE_NAME != ''
      set termguicolors
    elseif $VTE_VERSION != ''
      set termguicolors
    else
      set notermguicolors
    endif
  endif
endfunc

func! jalcine#tweaks#terminal#init() abort
  call jalcine#tweaks#terminal#update_colors()
endfunc

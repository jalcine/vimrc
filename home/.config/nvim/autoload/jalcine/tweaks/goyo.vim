func! jalcine#tweaks#init() abort
  " Nothing is needed.
endfunc

func! jalcine#tweaks#goyo_enter() abort
  Limelight
  call jalcine#theme#setup()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  NERDTreeClose
  TagbarClose
endfunction

func! jalcine#tweaks#goyo_leave() abort
  set scrolloff=5
  set showcmd
  set showmode
  Limelight
  call jalcine#theme#setup()
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  silent !tmux set status on
endfunction

function! s:goyo_enter()
  Limelight
  call color#tweak()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set scrolloff=5
  set showcmd
  set showmode
  Limelight
  call color#tweak()
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  silent !tmux set status on
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

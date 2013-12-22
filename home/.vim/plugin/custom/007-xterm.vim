" Make sure that GNU screen or tmux passes me my xkeys.
" link: http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term == "screen" || &term == "screen-256color"
  execute "set t_kP=\e[5;*~c"
  execute "set t_kN=\e[6;*~"
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
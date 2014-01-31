" File: autoload/jalcine.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Entry point to my personal configuration.
" Last Modified: 2014-01-31 02:14:22 EST

func! jalcine#roll_out()
  call jalcine#link_plxr()
  call jalcine#bind_konsole()
  call jalcine#plugins#setup()
  call jalcine#mappings#apply('general')
  autocmd VimEnter * silent call jalcine#colors#detect()
endfunc

func! jalcine#link_plxr()
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
endfunction

func! jalcine#bind_konsole()
  " So Konsole has this awesome ability to allow you edit almost anything
  " about it from the shell without any gunky API! This helps me switch the
  " color scheme and other things.
  silent !konsoleprofile CustomCursorColor=red
  autocmd VimEnter * silent !konsoleprofile UseCustomCursorColor=1;BlinkingCursorEnabled=1
  autocmd VimLeave * silent !konsoleprofile CustomCursorColor=gray;BlinkingCursorEnabled=0
endfunction


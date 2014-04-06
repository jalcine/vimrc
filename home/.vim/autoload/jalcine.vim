" File: autoload/jalcine.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Entry point to my personal configuration.

" Function: jalcine#roll_out()
" Brief:    An Autobot-designed function.
func! jalcine#roll_out()
  call jalcine#link_multiplexer()
  call jalcine#set_abbreviations()
  call jalcine#plugins#setup()
  call jalcine#mappings#apply('general')
  call jalcine#autogroups#set()
endfunc

" Function: jalcine#link_multiplexer()
" Brief:    Options for a shell multiplexer.
func! jalcine#link_multiplexer()
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

" Function: jalcine#set_abbreviations
" Brief:    Sets some abbreviations for phraes I use quite a bit.
func! jalcine#set_abbreviations()
  iabbrev jUName jalcine
  iabbrev jName  Jacky Alciné
  iabbrev jEmail me@jalcine.me
  iabbrev jSite  http://jalcine.me
  iabbrev email  e-mail
endfunc

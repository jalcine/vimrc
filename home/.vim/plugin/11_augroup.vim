" File:          plugin/augroup.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Augroups for jazz.
" Last Modified: 2014-06-10 21:17:35 EDT

func! s:reload_tmux()
  redraw | echomsg "[tmux -> vim] Sourced " . expand('%:p') . "." | redraw
  call system('tmux source-file ' . expand('%:p') . '; tmux display-message ' . 
        \ '"[tmux <- vim] Sourced ' . expand('%:p') . '"')
endfunc

augroup jalcine
  au!

  " Funky files.
  au BufReadPre *cpanfile   let &ft=perl
  au BufReadPre *pintofile  let &ft=perl
  au BufReadPre *.h++       let &ft=cpp
  au BufReadPre /usr/include/c++/* setlocal ft=cpp
  au BufReadPre *.gdb       let &ft=gdb
  au BufEnter   *           let &titlestring=expand('%:p')

  " Helps with editing tmux configuration files.
  au BufWritePost *tmux*.conf call s:reload_tmux()

  " Make sure we don't spell in certain windows.
  au QuickFixCmdPre * set nospell
augroup END

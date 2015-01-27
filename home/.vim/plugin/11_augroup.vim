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
  au BufReadPre *cpanfile   setlocal ft=perl
  au BufReadPre *pintofile  setlocal ft=perl
  au BufReadPre *.h++       setlocal ft=cpp

  " Helps with editing tmux configuration files.
  au BufWritePost ~/.homesick/repos/tmuxrc/home/.tmux*.conf call s:reload_tmux()

  " Make sure we don't spell in certain windows.
  au QuickFixCmdPost * setlocal nospell
augroup END

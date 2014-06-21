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

  " Perl-specific things
  au BufReadPre *cpanfile      set ft=perl
  au BufReadPre *pintofile     set ft=perl

  " Helps with editing tmux configuration files.
  au BufWritePost ~/.homesick/repos/dotfiles/home/.tmux*.conf call s:reload_tmux()
augroup END

" File: plugin/augroup.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: Augroups for jazz.
" Last Modified: May 21, 2014

augroup jalcine
  au!
  " Perl-specific things
  au BufReadPre *cpanfile      set ft=cpan.perl
  au BufReadPre *pintofile     set ft=pinto.perl

  " Helps with editing tmux configuration files.
  au BufWritePost ~/.tmux.conf   call s:reload_tmux()
  au BufWritePost ~/.tmux/*.conf call s:reload_tmux()
augroup END

func! s:reload_tmux()
  call system('tmux send-keys r')
  redraw | echomsg "[tmux] Reloaded root configuration file." | redraw
endfunc

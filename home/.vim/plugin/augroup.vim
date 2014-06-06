" File: plugin/augroup.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: Augroups for jazz.
" Last Modified: May 21, 2014

au BufReadPre *cpanfile   set ft=cpan.perl
au BufReadPre *pintofile  set ft=pinto.perl
au FileType   javascript  call JavaScriptFold()

" File:          autoload/jalcine/augroups.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Define the autogroups, Jacky.
" Last Modified: August 25, 2017



func! jalcine#augroups#setup()
  augroup jalcine-misc
    au!
    au BufEnter       * :syntax sync maxlines=200
    au FileReadPre    * Rooter
    au FileWritePost  * Neomake!
    au VimEnter         LocalVimRC!
    au TabNewEntered    TagbarOpenAutoClose
  augroup END

  augroup vimrc-langsupport
    au!
    au FileType python call jalcine#lang#python#tweak()
    au FileType php    call jalcine#lang#php#tweak()
  augroup END
endfunc

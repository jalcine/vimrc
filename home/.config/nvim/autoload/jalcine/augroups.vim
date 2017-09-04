" File:          autoload/jalcine/augroups.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Define the autogroups, Jacky.
" Last Modified: August 25, 2017



func! jalcine#augroups#setup() abort
  augroup jalcine-misc
    au!
    au BufEnter         * :syntax sync maxlines=200
    au FileReadPost     * <silent> Rooter
    au BufWritePost     * <silent> Neomake
    au BufReadPost      * <silent> Neomake
    au VimEnter           <silent> LocalVimRC!
    au User RooterChDir   <silent> TagbarOpenAutoClose
    au CompleteDone     * <silent> if pumvisible() == 0 | pclose | endif
  augroup END

  augroup vimrc-langsupport
    au!
    au FileType python call jalcine#lang#python#tweak()
    au FileType php    call jalcine#lang#php#tweak()
    au User CmSetup    call cm#register_source({'name' : 'deoplete',
          \ 'priority': 7,  
          \ 'abbreviation': '', 
          \ })
  augroup END
endfunc

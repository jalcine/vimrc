" File:          autoload/jalcine/augroups.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Define the autogroups, Jacky.
" Last Modified: August 25, 2017

func! jalcine#augroups#setup() abort
  augroup vimrc_misc
    au!
    au BufEnter         * :syntax sync maxlines=200
    au FileReadPost     * Rooter
    au BufWritePost     * Neomake
    au BufReadPost      * Neomake
    au VimEnter           <silent> LocalVimRC!
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

  augroup vimrc_goyo
      au User GoyoEnter nested call jalcine#tweaks#goyo#enter()
      au User GoyoLeave nested call jalcine#tweaks#goyo#leave()
  augroup END
endfunc

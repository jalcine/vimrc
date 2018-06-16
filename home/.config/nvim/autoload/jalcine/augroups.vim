" File:          autoload/jalcine/augroups.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Define the autogroups, Jacky.
" Last Modified: August 25, 2017

func! jalcine#augroups#setup() abort
  augroup vimrc_misc
    au!
    au BufEnter         * :syntax sync maxlines=200
    au User    Startified call jalcine#tweaks#terminal#adapt()
  augroup END

  augroup vimrc_auto_tmux_reload
    au!
    au FileWritePost ~/.tmux* !tmux source-file %:h
  augroup END

  augroup vimrc_term
    au!
    au TermOpen *        call jalcine#tweaks#terminal#adapt()
    au BufEnter term://* startinsert
    au BufLeave term://* stopinsert
  augroup END

  augroup vimrc-langsupport
    au!
    au FileType *              nested call jalcine#language_client#start_for_ft("<amatch>")
    au FileType python         nested call jalcine#lang#python#tweak()
    au FileType php            nested call jalcine#lang#php#tweak()
    au FileType css            nested setl omnifunc=csscomplete#CompleteCSS noci
    au FileType markdown,mkd   nested call jalcine#prose#enhance()
    au FileType txtfmt         nested call jalcine#prose#enhance()
    au FileType yaml           nested BracelessEnable +indent +fold +highlight
    au FileType python         nested BracelessEnable +indent +fold +highlight
    au FileType man            nested setlocal conceallevel=0
    au FileType quickfix       nested call jalcine#tweaks#terminal#adapt()
    au FileType loclist        nested call jalcine#tweaks#terminal#adapt()
  augroup END

  augroup vimrc_goyo
    au!
    au User GoyoEnter nested call jalcine#tweaks#goyo#enter()
    au User GoyoLeave nested call jalcine#tweaks#goyo#leave()
  augroup END

  augroup vimrc_init
    au!
    au VimEnter * Startify
  augroup END

  augroup on_change_colorscheme
    autocmd!
    autocmd ColorScheme * call jalcine#theme#customize()
  augroup END
endfunc

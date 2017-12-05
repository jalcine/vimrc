" File:          autoload/jalcine/augroups.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Define the autogroups, Jacky.
" Last Modified: August 25, 2017

func! jalcine#augroups#setup() abort
  augroup vimrc_misc
    au!
    au BufEnter         * :syntax sync maxlines=200
    au VimEnter           <silent> call <SID>VimEnter()
  augroup END

  augroup vimrc_auto_tmux_reload
    au!
    au FileWritePost ~/.tmux* !tmux source-file %:h
  augroup END

  augroup vimrc_term
    au!
    au TermOpen *        setl conceallevel=0 colorcolumn=0 relativenumber
    au BufEnter term://* startinsert
  augroup END

  augroup vimrc-langsupport
    au!
    au FileType *              call jalcine#language_client#start_for_ft("<amatch>")
    au FileType python         call jalcine#lang#python#tweak()
    au FileType php            call jalcine#lang#php#tweak()
    au FileType css            setl omnifunc=csscomplete#CompleteCSS noci
    au FileType markdown,mkd   call jalcine#prose#enhance()
    au FileType text,txtfmt    call jalcine#prose#enhance()
    au FileType yaml           BracelessEnable +indent +fold +highlight
    au FileType python         BracelessEnable +indent +fold +highlight
    au FileType man            setlocal conceallevel=0
  augroup END

  augroup vimrc_goyo
    au User GoyoEnter nested call jalcine#tweaks#goyo#enter()
    au User GoyoLeave nested call jalcine#tweaks#goyo#leave()
  augroup END

  augroup vimrc_colorscheme_lightline
    autocmd!
    autocmd ColorScheme * call jalcine#status#update_colorscheme()
  augroup END
endfunc

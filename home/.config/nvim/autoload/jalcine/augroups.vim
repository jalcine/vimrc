" File:          autoload/jalcine/augroups.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Define the autogroups, Jacky.
" Last Modified: August 25, 2017

func! jalcine#augroups#setup() abort
  augroup vimrc_misc
    au!
    au BufEnter         * :syntax sync maxlines=200
    au BufEnter         * Rooter
    au BufWritePost     * Neomake
    au BufReadPost      * Neomake
    au VimEnter           <silent> LocalVimRC!
    au User RooterChDir   call <SID>GenerateTagsInDir()
  augroup END

  augroup vimrc_tagbar
    au BufEnter         * nested :call tagbar#autoopen(0)
    au BufWinEnter      * if &previewwindow | setlocal nonumber | endif
  augroup END

  augroup vimrc_term
    au!
    au TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
    au BufEnter term://* startinsert
  augroup END

  augroup vimrc-langsupport
    au!
    au FileType *              call <SID>ConditionallyStartLanuageServer("<amatch>")
    au FileType python         call jalcine#lang#python#tweak()
    au FileType php            call jalcine#lang#php#tweak()
  augroup END

  augroup vimrc_goyo
    au User GoyoEnter nested call jalcine#tweaks#goyo#enter()
    au User GoyoLeave nested call jalcine#tweaks#goyo#leave()
  augroup END
endfunc

func! s:GenerateTagsInDir() abort
  if getcwd() != expand('$HOME')
    echomsg 'CWD: '. getcwd()
    GenCtags
    GenGTAGS
  endif
endfunc

func! s:ConditionallyStartLanuageServer(ft) abort
  let l:hasStartCommand = has_key(g:LanguageClient_serverCommands, a:ft)
  if l:hasStartCommand == 1
    LanguageClientStart
  endif
endfunc

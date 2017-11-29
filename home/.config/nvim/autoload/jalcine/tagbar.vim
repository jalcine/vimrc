" File:          jalcine/tagbar.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Tweaks for tagbar. 
" Last Modified: November 28, 2017

let s:vimrc_root = fnamemodify($MYVIMRC, ':p:h')

func! jalcine#tagbar#setup() abort
  call <SID>Configure()
endfunc

func! s:Configure() abort " {{{
  let g:tagbar_type_elixir = {
        \ 'ctagstype' : 'elixir',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
        \ ]
        \ }
  let g:tagbar_type_css = {
        \ 'ctagstype' : 'Css',
        \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
        \ ]
        \ }
  let g:tagbar_type_ruby = {
        \ 'kinds'      : ['m:modules',
        \ 'c:classes',
        \ 'C:constants',
        \ 'F:singleton methods',
        \ 'f:methods',
        \ 'a:aliases'],
        \ 'kind2scope' : { 'c' : 'class',
        \ 'm' : 'class' },
        \ 'scope2kind' : { 'class' : 'c' },
        \ 'ctagsbin'   : s:vimrc_root . '/bin/ripper-tags',
        \ 'ctagsargs'  : ['-f', '-']
        \ }
  let g:tagbar_type_javascript = {
        \ 'ctagsbin'   : s:vimrc_root . '/node_modules/.bin/jsctags',
        \ 'ctagsargs'  : ['-f', '-']
        \ }
  let g:tagbar_type_ansible = {
        \ 'ctagstype' : 'ansible',
        \ 'kinds' : [
        \ 't:tasks'
        \ ],
        \ 'sort' : 0
        \ }
  let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
        \ ]
        \ }
endfunc " }}}

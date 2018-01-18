" File:          jalcine/tagbar.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Tweaks for tags support.
" Last Modified: November 28, 2017
" vim: set fdm=marker fdl=0 :

let s:vimrc_root = fnamemodify($MYVIMRC, ':p:h')

func! jalcine#tags#setup() abort " {{{
  call <SID>ConfigureTagbar()
  call <SID>ConfigureGutentags()
endfunc " }}}

func! s:ConfigureTagbar() abort " {{{
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

func! s:ConfigureGutentags() abort " {{{
  let g:gutentags_generate_on_empty_buffer = 0
  let g:gutentags_ctags_tagfile = '.tags'
  let g:gutentags_cache_dir = s:vimrc_root . "/tags"
  let g:gutentags_ctags_executable_ruby = g:tagbar_type_ruby['ctagsbin']
  let g:gutentags_ctags_executable_javascript = g:tagbar_type_javascript['ctagsbin']
  let g:gutentags_file_list_command = {
        \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
        \ }

endfunc "}}}

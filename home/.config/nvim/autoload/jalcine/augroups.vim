" File:          autoload/jalcine/augroups.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Define the autogroups, Jacky.
" Last Modified: August 25, 2017

func! jalcine#augroups#setup() abort
  augroup vimrc_misc
    au!
    au BufEnter         * :syntax sync maxlines=200
    au VimEnter           <silent> LocalVimRC!
    au User RooterChDir   call <SID>GenerateTagsInDir()
  augroup END

  augroup vimrc_auto_tmux_reload
    au!
    au FileWritePost ~/.tmux* !tmux source-file %:h
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
    au FileType css            setl omnifunc=csscomplete#CompleteCSS noci
    au FileType markdown,mkd   call <SID>EnhanceTextEditing()
    au FileType text           call <SID>EnhanceTextEditing()
    au FileType yaml           BracelessEnable +indent +fold +highlight
    au FileType python         BracelessEnable +indent +fold +highlight
    au FileType man            setlocal conceallevel=0
  augroup END

  augroup vimrc_goyo
    au User GoyoEnter nested call jalcine#tweaks#goyo#enter()
    au User GoyoLeave nested call jalcine#tweaks#goyo#leave()
  augroup END
endfunc

func! s:GenerateTagsInDir() abort
endfunc

func! s:ConditionallyStartLanuageServer(ft) abort
  let l:hasStartCommand = has_key(g:LanguageClient_serverCommands, a:ft)
  if l:hasStartCommand == 1
    LanguageClientStart
  endif
endfunc

func! s:EnhanceTextEditing() abort
  let l:is_in_text = (&ft == 'text')
  setlocal foldlevel=6
  setlocal conceallevel=2

  call textobj#quote#init({
        \ 'educate': l:is_in_text
        \ })
  call textobj#sentence#init()
  call litecorrect#init()
  call pencil#init({
        \ 'wrap': (l:is_in_text) ? 'hard' : 'soft',
        \ 'autoformat': 1
        \ })
  call lexical#init()

  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight
  noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>
endfunc

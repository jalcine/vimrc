" File:          prose.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: November 29, 2017

func! jalcine#prose#enhance() abort
  let l:is_in_text = (&ft == 'text')
  setlocal foldlevel=6
  setlocal conceallevel=2

  call textobj#quote#init({
        \ 'educate': l:is_in_text
        \ })
  call textobj#sentence#init()
  call litecorrect#init()
  call pencil#init({
        \ 'wrap': 'soft',
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

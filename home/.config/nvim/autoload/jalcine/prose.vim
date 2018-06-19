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

  nmap <buffer> <silent> Q gqap
  xmap <buffer> <silent> Q gq
  nmap <buffer> <silent> <leader>Q vapJgqap
  nmap <buffer> <c-s> [s1z=<c-o>
  imap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight
  nmap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xmap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  imap <silent> <buffer> <F8> <C-o>:NextWordy<cr>
  nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off
  vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
  nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement
  nmap =d <Plug>DittoNext                " Jump to the next word
  nmap -d <Plug>DittoPrev                " Jump to the previous word
  nmap +d <Plug>DittoGood                " Ignore the word under the cursor
  nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
  nmap ]d <Plug>DittoMore                " Show the next matches
  nmap [d <Plug>DittoLess                " Show the previous matches
endfunc

" File: plugin/unite.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: Calls and mappings for Unite.
" Last Modified: June 13, 2014

if (exists('unite#set_profile'))
  call unite#filters#matcher_default#use(['matcher_regexp'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#set_profile('files', 'smartcase', 1)

  autocmd FileType unite call s:configure_unite_buffer()

  func! s:configure_unite_buffer()
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)<CR>
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)<CR>
    imap <buffer> <C-p>   <Plug>(unite_auto_preview)<CR>
  endfunc
endif
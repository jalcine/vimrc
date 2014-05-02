" Tweak filters for Unite.
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

autocmd FileType unite call s:configure_unite_buffer()

func! s:configure_unite_buffer()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)<CR>
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)<CR>
  imap <buffer> <C-p>   <Plug>(unite_auto_preview)<CR>
  imap <buffer> <F5>    <Plug>(unite_redraw)<CR>
  nmap <buffer> <F5>    <Plug>(unite_redraw)<CR>
  nmap <buffer> <ESC>   <Plug>(unite_all_exit)<CR>
  imap <buffer> <ESC>   <Plug>(unite_all_exit)<CR>
endfunc

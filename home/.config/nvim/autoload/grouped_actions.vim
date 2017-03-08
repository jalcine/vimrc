" File: grouped_actions.vim
" Author: Jacky Alciné <yo@jacky.wtf>
" Description: Some actions I like to have.
" Last Modified: February 11, 2017

" Function: write_in_today
" This wraps the act of me writing in my daily journal.
" TODO: Somehow ensure some short of encryption?
" TODO: Randomly inject a prompt?
func! s:write_in_today() abort
  let l:entry_path = 'Morning Entries/' . strftime("%Y-%m-%d")
  exec(':Note ' . l:entry_path)
  exec(':Goyo 100x50')
endfunc

function grouped_actions#apply()
  command! -bang Today call s:write_in_today()<bang>
endfunction

" Function: write_in_today
" This wraps the act of me writing in my daily journal.
func! s:write_in_today()
  let l:path = 'Morning Entries/' . strftime("%Y-%m-%d")
  exec(':Note ' . l:path)
  exec(':Goyo 100x30')
endfunc

function grouped_actions#apply()
  command! -bang Today call s:write_in_today()<bang>
endfunction

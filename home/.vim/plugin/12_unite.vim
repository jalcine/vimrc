" File: plugin/unite.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: Calls and mappings for Unite.
" Last Modified: June 13, 2014

call unite#filters#matcher_default#use([
  \ 'matcher_context',
  \ 'matcher_project_files',
  \ 'matcher_project_ignore_files',
  \ 'matcher_hide_current_file'
  \ ])

call unite#filters#sorter_default#use([
  \ 'sorter_rank',
  \ 'sorter_ftime'
  \ ])

call unite#filters#converter_default#use([
  \ 'converter_smart_path'
  \ ])

call unite#custom#profile('source/grep', 'context', {
  \   'quit' : 1
  \ })

call unite#custom#profile('default', 'context', {
  \   'start_insert': 1,
  \   'winheight': 10,
  \   'direction': 'botright',
  \   'auto-resize': 1
  \ })

autocmd FileType unite call s:configure_unite_buffer()

func! s:configure_unite_buffer()
  imap <silent><buffer><expr> <C-j>   <Plug>(unite_select_next_line)<CR>
  imap <silent><buffer><expr> <C-k>   <Plug>(unite_select_previous_line)<CR>
  imap <silent><buffer><expr> <C-p>   <Plug>(unite_auto_preview)<CR>
  imap <silent><buffer><expr> <C-s>   unite#do_action('split')<CR>
endfunc

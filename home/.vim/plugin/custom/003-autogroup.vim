" Update approriate files when I update them.
augroup autosourcecfg
  au!
  au BufWritePost ~/.vimrc source $MYVIMRC | echomsg "[vim] Configuration sourced."
  au BufWritePost *.local.vimrc source % | echomsg "[vim] Reloaded local Vim configuration."
  au BufWritePost *.tmux* silent! tmux source-file ~/.tmux.conf; tmux display-message 'Configuration reloaded from Vim..h
augroup END

" Toggle the current cursor line whenever I swap windows.
augroup cline
  au!
  au WinEnter,InsertEnter * setlocal cursorline cursorcolumn
  au WinLeave,InsertLeave * setlocal nocursorline nocursorcolumn
augroup END

" Some files might need to be filetype'd properly.
augroup fixfiletype
  au!
  au BufRead Guardfile setl filetype=ruby.guard
  au BufRead ~/.gitignore_global setl filetype=gitignore
augroup END

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-k>   <Plug>(unite_select_next_line)
  imap <buffer> <C-i>   <Plug>(unite_toggle_auto_preview)
  imap <buffer> <F5>   <Plug>(unite_redraw)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" Update approriate files when I update them.
augroup autosourcecfg
  au!
  au BufWritePost ~/.vimrc source $MYVIMRC | echomsg "[vim] Configuration sourced."
  au BufWritePost *.local.vimrc source % | echomsg "[vim] Reloaded local Vim configuration."
  au BufWritePost *.tmux* echomsg system("tmux source-file ~./.tmux.conf; tmux display-message 'Conf reloaded.")
augroup END

" Toggle the current cursor line whenever I swap windows.
augroup cline
  au!
  au WinLeave,InsertEnter * set cursorline
  au WinEnter,InsertLeave * set nocursorline
augroup END

" Some files might need to be filetype'd properly.
augroup fixfiletype
  au!
  au BufRead Guardfile setl filetype=guard.ruby
augroup END

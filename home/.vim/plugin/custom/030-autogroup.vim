" Update approriate files when I update them.
augroup autosourcecfg
  au!
  au BufWritePost ~/.vimrc source $MYVIMRC | echomsg "[vim] Configuration sourced."
  au BufWritePost *.local.vimrc source % | echomsg "[vim] Reloaded local Vim configuration."
  au BufWritePost *.tmux* echomsg system("tmux source-file ~./.tmux.conf; tmux display-message 'Conf reloaded.")
augroup END

" Adds in some format detection for specific files.
augroup moreformatdetect
  au!
  au BufReadPost *.scss    setlocal ft=css.scss
  au BufReadPost Gemfile   setlocal ft=bundler.ruby
  au BufReadPost Guardfile setlocal ft=guard.ruby
  au BufReadPost Procfile  setlocal ft=foreman.ruby
  au BufReadPost *_spec.rb setlocal ft=rspec.ruby
augroup END

" Toggle the current cursor line whenever I swap windows.
augroup cline
  au!
  au WinLeave,InsertEnter * set cursorline
  au WinEnter,InsertLeave * set nocursorline
augroup END



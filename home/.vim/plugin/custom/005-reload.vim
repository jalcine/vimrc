" Over time, I needed to constantly reload my Vim's configuration.
" This is my means of doing so.
func s:reload_everything()
  " TODO: Find all of the files for the plug-in.
  runtime! ~/.vim/plugin/custom/*.vim
endfunc

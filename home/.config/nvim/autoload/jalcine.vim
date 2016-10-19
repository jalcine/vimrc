augroup jalcine
  au!

  " Github auto-complete.
  au FileType markdown,gitcommit
    \ imap <C-x><C-x> <Plug>(github-complete-manual-completion)
  au FileType gitcommit setl omnifunc=github_complete#complete

  " Funky files.
  " au User YouCompleteMe call youcompleteme#Enable()

  " Reload tmux files when we edit them.
  au BufWritePost *tmux*.conf  call s:reload_tmux()
  au BufWritePost *tmux/*.conf call s:reload_tmux()

  " Tweak for particular file types.
  au FileType css setl iskeyword+=-
  au FileType gitcommit setl spell

  " Enable Neomake to run on builds.
  au BufWritePost * Neomake
  au BufReadPost  * Neomake

  " Clear Fugitive buffers.
  au BufReadPost fugitive://* set bufhidden=delete

  " Things for Unite
  au FileType unite call s:unite_settings()

  au BufEnter * let &titlestring=expand('%:p')

  " CoffeeScript jazz.
  au FileType coffee setl foldmethod=indent shiftwidth=2 expandtab
  au FileType javascript setl foldmethod=syntax

  au FileType css,scss setlocal foldmethod=marker foldmarker={,}
  au FileType css,scss nnoremap <silent> <leader>S vi{:sort<CR>
  au FileType ini set ft=dosini
  au FileType python setlocal foldmethod=indent
  au FileType markdown setlocal nolist
  au FileType vim setlocal fdm=indent keywordprg=:help

  au VimEnter * call sunlight#get_coords()

  au BufWrite * :Autoformat
augroup END

func! s:reload_tmux()
  redraw | echomsg '[tmux ➡️  vim] Sourced ' . expand('%:p') . '.' | redraw
  call system('tmux source-file ' . expand('%:p') . '; tmux display-message ' .
        \ '"[tmux ⬅️  vim] Sourced ' . expand('%:p') . '"')
endfunc


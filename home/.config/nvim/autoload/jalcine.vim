function! jalcine#liftoff() abort
  call plugins#bind()
  call grouped_actions#apply()
  call jalcine#define_augroup()
endfunction

function! jalcine#define_augroup() abort
  augroup jalcine
    au!

    " Ensure we set our colors.
    au VimEnter * call color#bind()

    " Funky files.
    au User YouCompleteMe call youcompleteme#Enable()

    " Reload tmux files when we edit them.
    au BufWritePost *tmux*.conf  call s:reload_tmux()
    au BufWritePost *tmux/*.conf call s:reload_tmux()

    " Tweak for particular file types.
    au FileType css setl iskeyword+=-
    au FileType gitcommit setl spell

    " Enable Neomake to run on builds.
    au BufReadPost  * Neomake

    " Clear Fugitive buffers.
    au BufReadPost fugitive://* set bufhidden=delete

    au BufEnter * let &titlestring=expand('%:p')

    au FileType css,scss setl foldmethod=marker foldmarker={,}
    au FileType ini set ft=dosini
    au FileType markdown setl nolist
    au FileType vim setl keywordprg=:help
  augroup END

  augroup textobj_quote
    autocmd!
    autocmd FileType markdown call textobj#quote#init()
    autocmd FileType notes call textobj#quote#init()
    autocmd FileType textile call textobj#quote#init()
    autocmd FileType text call textobj#quote#init({'educate': 0})
  augroup END

  augroup textobj_sentence
    autocmd!
    autocmd FileType markdown call textobj#sentence#init()
    autocmd FileType notes call textobj#sentence#init()
    autocmd FileType textile call textobj#sentence#init()
  augroup END

  augroup pencil
    autocmd!
    autocmd FileType markdown call pencil#init()
    autocmd FileType notes    call pencil#init()
  augroup END
endfunc

func! s:reload_tmux() abort
  redraw | echomsg '[tmux ➡️  vim] Sourced ' . expand('%:p') . '.' | redraw
  call system('tmux source-file ' . expand('%:p') . '; tmux display-message ' .
        \ '"[tmux ⬅️  vim] Sourced ' . expand('%:p') . '"')
endfunc

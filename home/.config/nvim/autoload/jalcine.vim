scriptencoding utf-8

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
    au BufReadPost   * Neomake
    au BufWritePost  * Neomake

    " Clear Fugitive buffers.
    au BufReadPost fugitive://* set bufhidden=delete

    au BufEnter * let &titlestring=expand('%:p')

    au FileType css,scss setl foldmethod=marker foldmarker={,}
    au FileType ini set ft=dosini
    au FileType markdown setl nolist
    au FileType vim setl keywordprg=:help
  augroup END

  augroup jalcine_goyo
    au User GoyoEnter nested call <SID>goyo_enter()
    au User GoyoLeave nested call <SID>goyo_leave()
  augroup END

  augroup textobj_quote
    autocmd!
    autocmd FileType markdown,notes,textile,text call textobj#quote#init()
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

function! s:goyo_enter() abort
  Limelight
  call color#tweak()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave() abort
  set scrolloff=5
  set showcmd
  set showmode
  Limelight
  call color#tweak()
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  silent !tmux set status on
endfunction

func! s:reload_tmux() abort
  redraw | echomsg '[tmux ➡️  vim] Sourced ' . expand('%:p') . '.' | redraw
  call system('tmux source-file ' . expand('%:p') . '; tmux display-message ' .
        \ '"[tmux ⬅️  vim] Sourced ' . expand('%:p') . '"')
endfunc

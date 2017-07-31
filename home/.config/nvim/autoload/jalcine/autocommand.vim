scriptencoding utf-8

func! jalcine#autocommand#apply() abort
  augroup jalcine
    au!

    " Set things up, regardless of when we started.
    if v:vim_did_enter
      call s:jalcine_neovim_setup()
    else
      au VimEnter * call s:jalcine_neovim_setup()
    endif

    " Funky files.
    au User YouCompleteMe call youcompleteme#Enable()
    au User Startified setlocal buftype=nofile

    " Reload tmux files when we edit them.
    au BufWritePost *tmux*.conf  call jalcine#tweaks#reload_tmux()
    au BufWritePost *tmux/*.conf call jalcine#tweaks#reload_tmux()

    " Tweak for particular file types.
    au FileType css setl iskeyword+=-
    au FileType gitcommit setl spell

    " Enable Neomake to run on builds.
    au BufWritePost * Neomake

    " Clear Fugitive buffers.
    au BufReadPost fugitive://* set bufhidden=delete
    au BufRead COMMIT_EDITMSG execute "normal! gg" | execute "normal! O" | startinsert

    au BufEnter * let &titlestring=expand('%:p')

    au FileType css,scss setl foldmethod=marker foldmarker={,}
    au FileType ini set ft=dosini
    au FileType markdown setl nolist
    au FileType vim setl keywordprg=:help

    au User vim-pyenv-activate-post call jalcine#plugins#update_python()
    au User RooterChDir call <SID>update_directory() 
  augroup END

  augroup jalcine_goyo
    au User GoyoEnter nested call jalcine#tweaks#goyo_enter()
    au User GoyoLeave nested call jalcine#tweaks#goyo_leave()
  augroup END

  augroup textobj_quote
    au!
    autocmd FileType markdown call textobj#quote#init()
    autocmd FileType notes    call textobj#quote#init()
    autocmd FileType help     call textobj#quote#init()
    autocmd FileType text     call textobj#quote#init()
  augroup END

  augroup textobj_sentence
    au!
    autocmd FileType markdown call textobj#sentence#init()
    autocmd FileType notes    call textobj#sentence#init()
    autocmd FileType help     call textobj#sentence#init()
    autocmd FileType text     call textobj#sentence#init()
  augroup END

  augroup pencil
    autocmd!
    autocmd FileType markdown call pencil#init()
    autocmd FileType notes    call pencil#init()
    autocmd FileType help     call pencil#init()
    autocmd FileType text     call pencil#init()
  augroup END
endfunc

func! s:goyo_enter() abort
  Limelight
  call color#tweak()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction
func! s:goyo_leave() abort
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

func! s:jalcine_neovim_setup() abort
  let l:order = [
        \ 'abbreviations',
        \ 'plugins',
        \ 'config',
        \ 'mappings',
        \ 'commands',
        \ 'color',
        \ ]

  for l:plugin_name in l:order
    exec('call jalcine#' . l:plugin_name . '#setup()')
  endfor

  if !argc()
    call jalcine#projects#show_initial_view()
  endif
  LanguageClientStart
endfunc

func! s:update_directory() abort
  let l:dir = FindRootDirectory()
  let g:test#project_root = l:dir
  call jalcine#projects#enter_directory(l:dir)
endfunc

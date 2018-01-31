" File:          jalcine/language_client.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Tweaks and commands for using LanguageServers. 
" Last Modified: November 28, 2017

let s:vimrc_root = fnamemodify($MYVIMRC, ':p:h')

func! jalcine#language_client#setup() abort
  call <SID>Configure()
endfunc

func! jalcine#language_client#start_for_ft(ft) abort
  if has_key(g:LanguageClient_serverCommands, a:ft) == 1
    LanguageClientStart
    set formatexpr=LanguageClient_textDocument_rangeFormatting()
  else
    set formatexpr&vim
  endif
endfunc

func! s:Configure() abort " {{{
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'javascript': [ 'neovim-language-server-javascript' ],
        \ 'python': ['pyenv', 'exec', 'pyls'],
        \ 'go': ['goenv', 'exec', 'go-langserver'],
        \ 'php': ['neovim-language-server-php'],
        \ 'ruby': [ s:vimrc_root . '/bin/language_server-ruby' ],
        \ 'elixir': [ 'neovim-language-server-elixir'],
        \ 'css': ['css-language-server', '--stdio'],
        \ 'ember': ['neovim-language-server-ember']
        \ }

  if exists('$DEBUG')
    let g:LanguageClient_trace = "verbose"
    let g:LanguageClient_windowLogMessageLevel = "Log"
    let g:LanguageClient_serverCommands.javascript += ['--trace', '--logfile', s:vimrc_root . '/logs/lsp-javascript.log' ]
    let g:LanguageClient_serverCommands.python += ['--log-file', s:vimrc_root . '/logs/lsp-python.log' ]
    let g:LanguageClient_serverCommands.go += ['-logfile', s:vimrc_root . '/logs/lsp-go.log' ]
  endif

  let l:aliases = {
        \ 'javascript': ['javascript.jsx', 'jsx'],
        \ 'ember': ['javascript.ember']
        \ }

  for l:alias in keys(l:aliases)
    for subAlias in l:aliases[l:alias]
      let g:LanguageClient_serverCommands[subAlias] = g:LanguageClient_serverCommands[l:alias]
    endfor
  endfor

  if !exists('&formatexpr')
    set formatexpr=LanguageClient_textDocument_rangeFormatting()
  endif
endfunc " }}}

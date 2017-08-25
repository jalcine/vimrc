" File:          jalcine/lang/python.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Enhancements to make Vim useful with Python.
" Last Modified: August 24, 2017

func! jalcine#lang#python#tweak() abort
  setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
endfunc

func! s:SetupJediAndPyenv() abort
  if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
      let major_version = pyenv#python#get_internal_major_version()
      call jedi#force_py_version(major_version)
    endfunction
    augroup vim-pyenv-custom-augroup
      autocmd! *
      autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
      autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
    augroup END
  endif
endfunc

func! s:SetupPythonHighlightOptions() abort
  let g:python_highlight_all = 1
  let g:python_slow_sync = 0
endfunc

func! s:SetupPythonPaths() abort
  let g:python3_host_prog = systemlist('pyenv which python3')[0]
  let g:python_host_prog = systemlist('pyenv which python2')[0]
endfunc

func! jalcine#lang#python#setup() abort
  call <SID>SetupPythonHighlightOptions()
  call <SID>SetupJediAndPyenv()
  call <SID>SetupPythonPaths()
  " TODO: Find the venv defined for Neovim.
  " TODO: Assoc python2 to Neovim.
  " TODO: Assoc python3 to Neovim.
endfunc

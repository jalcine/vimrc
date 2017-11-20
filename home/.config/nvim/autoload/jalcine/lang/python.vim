" File:          jalcine/lang/python.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Enhancements to make Vim useful with Python.
" Last Modified: August 24, 2017

func! jalcine#lang#python#tweak() abort
  setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
endfunc

function! s:jedi_auto_force_py_version() abort
  let l:major_version = pyenv#python#get_internal_major_version()
  call jedi#force_py_version(l:major_version)
endfunction

func! s:SetupJediWithPyenv() abort
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call <SID>jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call <SID>jedi_auto_force_py_version()
  augroup END
endfunc

func! s:SetupPythonHighlightOptions() abort
  let g:python_highlight_all = 1
  let g:python_slow_sync = 1
endfunc

func! jalcine#lang#python#setup() abort
  call <SID>SetupPythonHighlightOptions()
  call <SID>SetupJediWithPyenv()
endfunc

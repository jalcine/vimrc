" File:          jalcine/lang/python.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Enhancements to make Vim useful with Python.
" Last Modified: August 24, 2017

func! jalcine#lang#python#tweak() abort
  setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
        \ formatoptions+=croq softtabstop=4
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
endfunc

func! jalcine#lang#python#setup() abort
  call <SID>SetupPythonHighlightOptions()
  " TODO: Find the venv defined for Neovim.
  " TODO: Assoc python2 to Neovim.
  " TODO: Assoc python3 to Neovim.
endfunc

func! s:SetupPythonHighlightOptions() abort
  let g:python_highlight_all = 1
  let g:python_slow_sync = 0
endfunc

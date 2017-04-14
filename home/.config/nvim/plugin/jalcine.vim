" File: plugin/jalcine.vim
" Description: Inception point for my configuration.
" Author: Jacky Alciné <yo@jacky.wtf>
" Last Modified: Today

scriptencoding utf-8

if exists('$HOME/.config/nvim/local.vim')
  source $HOME/.config/nvim/local.vim
endif

call jalcine#autocommand#apply()

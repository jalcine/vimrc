" File: plugin/jalcine.vim
" Description: Inception point for my configuration.
" Author: Jacky Alciné <yo@jacky.wtf>

scriptencoding utf-8

" Load in local configuration. This isn't like localvimrc but some final
" configuration options that needs to be imported before we do anything else.
if exists('$HOME/.config/nvim/local.vim')
  source $HOME/.config/nvim/local.vim
endif

call jalcine#autocommand#apply()

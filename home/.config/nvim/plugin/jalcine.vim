" File: plugin/jalcine.vim
" Description: Inception point for my configuration.
" Author: Jacky Alciné <yo@jacky.wtf>

scriptencoding utf-8
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175
set termguicolors
set t_Co=256

call jalcine#autocommand#apply()

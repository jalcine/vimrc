" File:          autoload/jalcine/journal.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Logic around how I journal with Vim.
" Last Modified: November 29, 2017

func! jalcine#journal#setup() abort
  call <SID>AddCommand()
endfunc

func! s:AddCommand() abort
  command! Today call <SID>LaunchNoteOfTheDay()
endfunc

func! s:LaunchNoteOfTheDay() abort
  execute ':Note Morning Entries/' . strftime('%Y-%m-%d')
  Goyo 80x
endfunc

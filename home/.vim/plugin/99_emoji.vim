" File:           plugin/99_emoji.vim
" Author:         Jacky Alcine <me@jalcine.me>
" Description:    Makes use of 'abbrev' to render emoji.
" Last Modified:  July 23, 2015

" So this takes all of the known emoji from a list and adds them to an 'abbrev'
" dictionary.

func! s:set_abbrev(plain_text,emoji_text)
  execute('iabbrev ' . a:plain_text . ' ' . a:emoji_text)
endfunc!

if emoji#available()
  let s:emojis = emoji#list()
  echomsg s:emojis
  call s:set_abbrev('fb','foobar')
endif

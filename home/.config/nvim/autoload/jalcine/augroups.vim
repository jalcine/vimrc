func! jalcine#augroups#setup()

  augroup jalcine-misc
    autocmd!
    
    " I tend to work on pretty fast computers.
    " TODO: Make this toggleable, like over SSH.
    autocmd BufEnter * :syntax sync maxlines=200

    autocmd VimEnter <silent> LocalVimRC!
  augroup END

  augroup vimrc-langsupport
    autocmd!
    autocmd FileType python call jalcine#lang#python#tweak()
    autocmd FileType php    call jalcine#lang#php#tweak()
  augroup END
endfunc

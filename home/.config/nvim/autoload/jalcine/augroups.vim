func! jalcine#augroups#setup()

  augroup jalcine-misc
    autocmd!
    
    " I tend to work on pretty fast computers.
    " TODO: Make this toggleable, like over SSH.
    autocmd BufEnter * :syntax sync maxlines=200

    autocmd VimEnter <silent> LocalVimRC
  augroup END

  augroup jalcine-lang-php
    autocmd!
    function! IPhpInsertUse()
      call PhpInsertUse()
      call feedkeys('a', 'n')
    endfunction
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

    function! IPhpExpandClass()
      call PhpExpandClass()
      call feedkeys('a', 'n')
    endfunction
    autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
    autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
    autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
  augroup END

  augroup vimrc-python
    autocmd!
    autocmd FileType python call jalcine#lang#python#tweak()

    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
          \ formatoptions+=croq softtabstop=4
          \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
  augroup END

endfunc

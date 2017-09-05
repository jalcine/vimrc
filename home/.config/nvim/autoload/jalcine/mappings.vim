" File:          autoload/jalcine/mappings.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Defines dynamic and static mappings.
" Last Modified: August 25, 2017
" vim: set fdm=marker :

" options {{{
let g:jalcine.mappings = {
      \ 'leader':  ','
      \ }
" }}}

func! jalcine#mappings#apply_bulk(mappings_list, opts) abort
  for a_mapping in a:mappings_list
    let l:command = a_mapping[0]

    if has_key(a:opts, 'prefix')
      let l:command = a:opts.prefix . l:command
    endif

    let l:modes = get(l:a_mapping, 2, 'n')
    let l:idx = 0
    while l:idx < len(l:modes)
      let l:mode = l:modes[l:idx : 1]
      let l:exc_cmd = mode . 'noremap '
            \ . '<silent> '
            \ . g:jalcine.mappings.leader . l:command
            \ . ' '
            \ . get(a_mapping, 1)
      exec l:exc_cmd
      let l:idx += 1
    endwhile
  endfor
endfunc

func! jalcine#mappings#setup() abort
  " Define the leader!
  exec 'let mapleader="' . g:jalcine.mappings.leader . '"'

  " Toggle the state of search highlighting locally.
  nnoremap <silent> <leader>h :setlocal hlsearch!<cr>

  " Time & Date Values {{{
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

  " Inject the current time with the labeling of the time-zone.
  inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
  cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>

  " Inject the current date and time (in Insert or Command mode).
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>

  " Inject the current date in Insert or Command mode).
  inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
  cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
  " }}}

  " clipboard tweaks {{{
  noremap YY "+y<CR>
  noremap <leader>p "+gP<CR>
  noremap XX "+x<CR>
  " }}}

  " {{{ Bulk Mappings
  " quickfix
  call jalcine#mappings#apply_bulk([
        \ ['e', '<ESC>:cnext<CR>'],
        \ ['f', '<ESC>:cfirst<CR>'],
        \ ['l', '<ESC>:clast<CR>'],
        \ ['o', '<ESC>:cwindow<CR>'],
        \ ['p', '<ESC>:cprevious<CR>'],
        \ ['x', '<ESC>:cclose<CR>'],
        \ ['X', '<ESC>:windo cclose<CR>'],
        \ ], { 'prefix': 'q' })

  " loclist
  call jalcine#mappings#apply_bulk([
        \ ['e', '<ESC>:lnext<CR>'],
        \ ['f', '<ESC>:lfirst<CR>'],
        \ ['l', '<ESC>:llast<CR>'],
        \ ['o', '<ESC>:lwindow<CR>'],
        \ ['p', '<ESC>:lprevious<CR>'],
        \ ['x', '<ESC>:lclose<CR>'],
        \ ['X', '<ESC>:windo lclose<CR>'],
        \ ], { 'prefix': 'l' })
  " }}}
endfunc

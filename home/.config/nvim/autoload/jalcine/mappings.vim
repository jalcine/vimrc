" File:          autoload/jalcine/mappings.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Defines dynamic and static mappings.
" Last Modified: August 25, 2017
" vim: set fdm=marker :

" options {{{
let g:jalcine.mappings = {
      \ 'leader':  ',',
      \ 'localLeader':  '\\'
      \ }
" }}}

func! jalcine#mappings#apply_bulk(mappings_list, opts) abort " {{{
  for l:a_mapping in a:mappings_list
    let l:command = l:a_mapping[0]
    let l:map_format = 'map'

    if has_key(a:opts, 'prefix')
      let l:command = a:opts.prefix . l:command
    endif

    if has_key(a:opts, 'remap')
      let l:map_format = 'noremap'
    endif

    if has_key(a:opts, 'silent')
      let l:map_format .= ' <silent>'
    endif

    let l:modes = get(l:a_mapping, 2, 'n')
    let l:idx = 0
    while l:idx < len(l:modes)
      let l:mode = l:modes[l:idx : 1]
      let l:exc_cmd = l:mode . l:map_format
            \ . g:jalcine.mappings.leader . l:command
            \ . ' '
            \ . get(l:a_mapping, 1)
      exec l:exc_cmd
      let l:idx += 1
    endwhile
  endfor
endfunc " }}}

func! jalcine#mappings#setup() abort " {{{
  " Define the leader!
  exec 'let g:mapleader="' . g:jalcine.mappings.leader . '"'
  exec 'let g:maplocalleader="' . g:jalcine.mappings.localLeader. '"'
  "
  " Ensure that InsertLeave is triggered.
  inoremap <c-c> <ESC>
  "
  " {{{ Terminal
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
  " }}}
  "
  " Moving in popmenu menu.
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  "
  " Rewrite 'vhe' to 'vert help'.
  cnoremap vhe vert help
  "
  " Show me tags.
  nnoremap <F8> :TagbarToggle<CR>
  "
  " Focuses Vim.
  nnoremap <silent> <leader><space> :Goyo<CR>
  "
  " Time & Date Values {{{
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>
  "
  " Inject the current time with the labeling of the time-zone.
  inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
  cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>
  "
  " Inject the current date and time (in Insert or Command mode).
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>
  "
  " Inject the current date in Insert or Command mode).
  inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
  cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
  " }}}
  "
  " clipboard tweaks {{{
  noremap YY "+y<CR>
  noremap <leader>p "+gP<CR>
  noremap XX "+x<CR>
  " }}}
  "
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
  "
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
endfunc " }}}

func! mappings#bind()
  " {{{ Leaders and Accessibility
  " PASTE mo'fo!
  set pastetoggle=<F2>

  " Set my leader to the comma key.
  let g:mapleader=','

  " Set buffer-local mappings to the key above <Enter>
  let g:maplocalleader='\\'

  " One less hit to get to the command-line.
  nnoremap ; :

  " Toggle the state of search highlighting locally.
  nnoremap <silent> <leader>h :setlocal hlsearch!<cr>

  " Toggle the state of spelling locally.
  nnoremap <silent> <leader>sp :setlocal spell!<cr>

  " Cold turkey; no more arrows motions.
  nnoremap <silent> <up>    <nop>
  nnoremap <silent> <down>  <nop>
  nnoremap <silent> <left>  <nop>
  nnoremap <silent> <right> <nop>

  " Make it easy to jump around from term emu to Vim.
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l

  " {{{ Timing options
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

  " Inject the current time with the labeling of the time-zone.
  inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
  cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>

  " Inject the current date and time (in Insert or Command mode).
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>

  " Inject the current date and time (in Insert or Command mode).
  inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
  cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
  " }}}

  " Strip trailing whitespace from the end of files.
  nnoremap <silent> <leader>sw :%s/\s$//g<cr>

  " Formats the current buffer.
  nnoremap <silent><F3> :Autoformat<CR><CR>

  " Focuses Vim.
  nnoremap <silent> <leader><space> :Goyo
  nnoremap <silent> <leader>L <Plug>(Limelight)

  " {{{ Bind make command.
  nnoremap [make] <nop>
  nmap <leader>m [make]
  nnoremap <silent> [make]<space>  :Make<space>
  nnoremap <silent> [make]a        :Make all<CR>
  nnoremap <silent> [make]c        :Make clean<CR>
  nnoremap <silent> [make]i        :Make install<CR>
  nnoremap <silent> [make]t        :Make test<CR>
  nnoremap <silent> [make]tb       :call('Make',['test',expand('%')])<CR>
  nnoremap <silent> [make]u        :Make uninstall<CR>
  " }}}

  " {{{ Travel over errors.
  nnoremap [quickfix] <nop>
  nmap <leader>q [quickfix]
  nnoremap <silent> [quickfix]e <ESC>:cnext<CR>
  nnoremap <silent> [quickfix]f <ESC>:cfirst<CR>
  nnoremap <silent> [quickfix]l <ESC>:clast<CR>
  nnoremap <silent> [quickfix]o <ESC>:cwindow<CR>
  nnoremap <silent> [quickfix]p <ESC>:cprevious<CR>
  nnoremap <silent> [quickfix]x <ESC>:cclose<CR>

  nnoremap [loclist] <nop>
  nmap <leader>l [loclist]
  nnoremap <silent> [loclist]e <ESC>:lnext<CR>
  nnoremap <silent> [loclist]f <ESC>:lfirst<CR>
  nnoremap <silent> [loclist]l <ESC>:llast<CR>
  nnoremap <silent> [loclist]o <ESC>:lwindow<CR>
  nnoremap <silent> [loclist]p <ESC>:lprevious<CR>
  nnoremap <silent> [loclist]x <ESC>:lclose<CR>
  " }}}

  " Rewrite 'vhe' to 'vert help'.
  cnoremap vhe vert help

  " Let me write to sudo whenever possible.
  cnoremap sw% w !sudo tee %
  " }}}

  " {{{ Git helpers
  command! Greview :Git! diff --staged
  nnoremap [git] <nop>
  nmap <leader>g [git]
  nnoremap <silent> [git]a   :Git add<space>
  nnoremap <silent> [git]ab  :Git add %<cr>
  nnoremap <silent> [git]b   :Gbrowse<CR>
  vnoremap <silent> [git]b   :Gbrowse<CR>
  nnoremap <silent> [git]c   :Git commit<space>
  nnoremap <silent> [git]C   :Gcommit --branch --verbose %<CR>
  nnoremap <silent> [git]co  :Git checkout<space>
  nnoremap <silent> [git]f   :Git fetch<space>
  nnoremap <silent> [git]fa  :Git fetch --all<CR>
  nnoremap <silent> [git]p   :Git push<space>
  nnoremap <silent> [git]P   :Git push<CR>
  nnoremap <silent> [git]rm  :Gremove %<CR>
  nnoremap <silent> [git]rmc :Git rm --cached %<CR>
  nnoremap <silent> [git]r   :Greview<cr>
  nnoremap <silent> [git]l   :FzfCommits<CR>
  " }}}

  " {{{ testing
  nnoremap [vimtest] <nop>
  nmap <leader>v [vimtest]
  nnoremap <silent> [vimtest]t :TestNearest<CR>
  nnoremap <silent> [vimtest]f :TestFile<CR>
  nnoremap <silent> [vimtest]a :TestSuite<CR>
  nnoremap <silent> [vimtest]l :TestLast<CR>
  nnoremap <silent> [vimtest]g :TestVisit<CR>
  " }}}

  map <Leader>nt <plug>NERDTreeTabsToggle<CR>

  func! s:toggle_visibility()
    setlocal list!
    if &conceallevel != 0
      setlocal conceallevel=0
    else
      setlocal conceallevel=2
    endif
  endfunc

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

  " Toggle the visibilty of non-text characters and conceals.
  nnoremap <silent> <leader>k :call <SID>toggle_visibility()<cr>

  " Handle file discovery options.
  nnoremap [filesearch] <nop>
  nmap <leader>f [filesearch]
  nnoremap <silent> [filesearch]a call search#all_files()<CR>
endfunc

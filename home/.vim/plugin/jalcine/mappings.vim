" File: plugin/mappings.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Definitions of mappings in the application.
" Last Modified: 2014-01-31 02:29:05 EST

function jalcine#mappings#apply(level)
  if a:level == 'general'
    jalcine#mappings#apply_general()
  elseif a:level == 'plugin'
    jalcine#mappings#apply_plugin()
  endif
endfunction

function jalcine#mappings#apply_plugin()
  " Rotate in the list of colors.
  nnoremap <silent> <leader>ks :call jalcine#colors#rotate<CR>

  " Make it easy to get to things I'd use more than once.
  nnoremap <silent><F6> :TagbarToggle<CR>
  nnoremap <silent><F7> :NERDTreeToggle<CR>

  " INVOKE UNITE.
  nnoremap <leader>p :Unite -buffer-name=files -start-insert
        \ file_rec/async file_mru buffer tag tag/file tag/include
        \ webcolorname tab jump mapping history/yank window
        \ rails/bundle rails/bundled_gem rails/stylesheet rails/view
        \ rails/javascript rails/config rails/controller rails/features
        \ tmux/clients tmux/sessions tmux/panes tmux/windows tmux
        \ git_modified git_untracked git_cached launcher<cr>

  "{{{ Tabularize
  vnoremap <leader>a: :Tabularize /:<CR>
  vnoremap <leader>a= :Tabularize /=<CR>
  vnoremap <leader>a{ :Tabularize /{<CR>
  nnoremap <leader>a: :Tabularize /:<CR>
  nnoremap <leader>a= :Tabularize /=<CR>
  nnoremap <leader>a{ :Tabularize /{<CR>
  "}}}

  "{{{ Vimux
  nnoremap <Leader>to :VimuxOpenPane<CR>
  nnoremap <Leader>tp :VimuxPromptCommand<CR>
  nnoremap <Leader>tt :VimuxRunLastCommand<CR>
  nnoremap <Leader>tc :VimuxCloseRunner<CR>
  vnoremap <Leader>ts "vy :call s:VimuxRepl()<CR>
  nnoremap <Leader>ts vip<LocalLeader>ts<CR>

  " Git helpers
  nnoremap <leader>gc  :Git commit<space>
  nnoremap <leader>gco :Git checkout<space>
  nnoremap <leader>gp  :Git push<space>
  nnoremap <leader>gfa :Git fetch --all<CR>
  nnoremap <leader>gf  :Git fetch<space>
  nnoremap <leader>grm :Git rm %<CR>
  nnoremap <leader>grmc :Git rm --cached %<CR>
  nnoremap <leader>gab :Git add %<cr>
  nnoremap <leader>ga   :Git add<space>

endfunction

function! s:VimuxRepl()
  call VimuxSendText(@v)
  call VimuxSendKeys("<Enter>")
endfunction

function jalcine#mappings#apply_general()
  " One less key to press to enter the Vim shell.
  nnoremap ; :

  " Toggle the use of list characters.
  nnoremap <silent> <leader>l :set list!<cr>

  " Toggle the state of search highlighting locally.
  nnoremap <silent> <leader>h :setlocal hlsearch!<CR>

  " Toggle the state of spelling locally.
  nnoremap <silent> <leader>j :setlocal spell!<CR>

  " Toggle the visibility of cursor lines.
  nnoremap <silent> <leader>cl :setlocal cursorline! cursorcolumn!<CR>

  " Toggle the current fold.
  nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

  " Inject the current date.
  inoremap <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

  " Inject the current time with the labeling of the time-zone.
  inoremap <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
  cnoremap <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>

  " Inject the current date and time (in Insert or Command mode).
  inoremap <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
  cnoremap <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>

  " Disable classic arrow-key navigation in Normal mode.
  nnoremap <Up>     <NOP>
  nnoremap <Down>   <NOP>
  nnoremap <Left>   <NOP>
  nnoremap <Right>  <NOP>
  nnoremap <C-w><Up>     <NOP>
  nnoremap <C-w><Down>   <NOP>
  nnoremap <C-w><Left>   <NOP>
  nnoremap <C-w><Right>  <NOP>

  " Formats the current buffer.
  nnoremap <leader>f gg=G

  " Bind make command.
  nnoremap <leader>ma :make all<CR>
  nnoremap <leader>mc :make clean<CR>
  nnoremap <leader>mi :make install<CR>
  nnoremap <leader>mu :make uninstall<CR>
  nnoremap <leader>mt :make test<CR>

  " Travel over errors.
  nnoremap <leader>ce <ESC>:cnext<CR>
  nnoremap <leader>cp <ESC>:cprevious<CR>
  nnoremap <leader>co <ESC>:cwindow<CR>
  nnoremap <leader>cf <ESC>:cfirst<CR>
  nnoremap <leader>cl <ESC>:clast<CR>

  " Rewrite 'vhe' to 'vert help'.
  cnoremap vhe vert help

  " Let me write to sudo whenever possible.
  cnoremap sw% w !sudo te %

  " Reload my sources.
  nnoremap <F5> :so ~/.vimrc<CR> | :runtime! ~/.vim/plugin/custom/*.vim<CR>
endfun

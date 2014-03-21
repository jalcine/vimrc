" vim: set ft=vim fdm=indent
" File: plugin/mappings.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Definitions of mappings in the application.
" Last Modified: 2014-01-31 02:29:05 EST

function! s:VimuxRepl()
  call VimuxSendText(@v)
  call VimuxSendKeys("<Enter>")
endfunction

function! s:build_current_project()
  if cmake#util#has_project()
    call cmake#commands#build_current()
  else
    make()
  endif
endfunction

func! jalcine#mappings#apply(level)
  if a:level == 'general'
    call jalcine#mappings#apply_general()
  elseif a:level == 'plugin'
    call jalcine#mappings#apply_plugin()
  endif
endfunction

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_length'])

func! jalcine#mappings#invoke_unite(scope)
  let sources=g:jalcine_unite_sources
  let options=g:jalcine_unite_options

  if exists('b:jalcine_unite_sources')
    let sources = sources . " " . b:jalcine_unite_sources
  endif

  if exists('b:jalcine_unite_options')
    let options = options . " " . b:jalcine_unite_options
  endif

  if exists('g:jalcine_unite_extra_sources')
    let sources = sources . " " . b:jalcine_unite_extra_sources
  endif

  if exists('g:jalcine_unite_extra_options')
    let options = options . " " . g:jalcine_unite_extra_options
  endif

  " Look for Rails.
  if a:scope == 'rails'
    let sources = ' ' .
      \ 'rails/bundle rails/bundled_gem rails/stylesheet rails/view ' .
      \ 'rails/javascript rails/config rails/controller rails/features ' .
      \ 'rails/config rails/db rails/spec rails/log rails/route ' .
      \ 'rails/heroku rails/view rails/stylesheet rails/schema rails/rake'
  elseif a:scope == 'tags'
    let sources = 'tag tag/include'
  elseif a:scope == 'tmux'
    let sources = 'tmux/panes tmux/sessions tmux/windows'
  elseif a:scope == 'files'
    let sources = 'file_rec/async:!'
  endif

  exec(':Unite ' . options . ' ' . sources)
endfunction

func! jalcine#mappings#define_for_unite()
  imap <buffer>        <C-k>  <Plug>(unite_select_previous_line)
  imap <buffer>        <C-j>  <Plug>(unite_select_next_line)
  imap <buffer>        <C-i>  <Plug>(unite_toggle_auto_preview)
  imap <buffer>        <F5>   <Plug>(unite_redraw)
  imap <buffer>        <ESC>  <Plug>(unite_exit)
  imap <buffer><expr>  <C-x>  :call unite#do_action('split')<CR>
  imap <buffer><expr>  <C-v>  :call unite#do_action('vsplit')<CR>
  imap <buffer><expr>  <C-t>  :call unite#do_action('tabopen')<CR>
endfunction

func! jalcine#mappings#apply_plugin()
  " Reload the configuration.
  nnoremap <F5> :call jalcine#autogroups#reload()<cr>

  " Rotate in the list of colors.
  nnoremap <silent> <leader>ks :call jalcine#colors#rotate()<CR>

  " Make it easy to get to things I'd use more than once.
  nnoremap <silent><F6> :TagbarToggle<CR>
  nnoremap <silent><F7> :NERDTreeToggle<CR>
  nnoremap <silent><F8> :call s:build_current_project()<CR>

  " INVOKE UNITE.
  nnoremap <silent><leader>p  :call jalcine#mappings#invoke_unite('general')<CR>
  nnoremap <silent><leader>pr :call jalcine#mappings#invoke_unite('rails')<CR>
  nnoremap <silent><leader>pt :call jalcine#mappings#invoke_unite('tags')<CR>
  nnoremap <silent><leader>pf :call jalcine#mappings#invoke_unite('files')<CR>
  nnoremap <silent><leader>px :call jalcine#mappings#invoke_unite('tmux')<CR>

  "{{{ Tabularize
  vnoremap <leader>a: :Tabularize /:<CR>
  vnoremap <leader>a= :Tabularize /=<CR>
  vnoremap <leader>a{ :Tabularize /{<CR>
  nnoremap <leader>a: :Tabularize /:<CR>
  nnoremap <leader>a= :Tabularize /=<CR>
  nnoremap <leader>a{ :Tabularize /{<CR>
  "}}}

  "{{{ Vimux
  nnoremap <leader>to      :VimuxOpenPane<CR>
  nnoremap <leader>tp      :VimuxPromptCommand<CR>
  nnoremap <leader>tt      :VimuxRunLastCommand<CR>
  nnoremap <leader>tc      :VimuxCloseRunner<CR>
  vnoremap <leader>ts      "vy :call s:VimuxRepl()<CR>
  nnoremap <leader>ts      vip<LocalLeader>ts<CR>
  nnoremap <leader>t<Up>   :VimuxScrollUpInspect<CR>
  nnoremap <leader>t<Down> :VimuxScrollDownInspect<CR>

  " Git helpers
  nnoremap <leader>gc   :Git commit<space>
  nnoremap <leader>gco  :Git checkout<space>
  nnoremap <leader>gp   :Git push<space>
  nnoremap <leader>gfa  :Git fetch --all<CR>
  nnoremap <leader>gf   :Git fetch<space>
  nnoremap <leader>grm  :Git rm %<CR>
  nnoremap <leader>grmc :Git rm --cached %<CR>
  nnoremap <leader>gab  :Git add %<cr>
  nnoremap <leader>ga   :Git add<space>
endfunction

func! jalcine#mappings#apply_general()
  " One less key to press to enter the Vim shell.
  nnoremap ; :

  " Toggle the use of list characters.
  nnoremap <silent> <leader>l :set list!<cr>

  " Toggle the state of search highlighting locally.
  nnoremap <silent> <leader>h :setlocal hlsearch!<CR>

  " Toggle the state of spelling locally.
  nnoremap <silent> <leader>j :setlocal spell!<CR>

  " Toggle the current fold.
  nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

  " Inject the current date.
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

  " Inject the current time with the labeling of the time-zone.
  inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>

  " Inject the current date and time (in Insert or Command mode).
  inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
  cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>

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
  nnoremap <silent> <leader>ma :call s:build_current_project()<CR>
  nnoremap <silent> <leader>mc :make clean<CR>
  nnoremap <silent> <leader>mi :make install<CR>
  nnoremap <silent> <leader>mu :make uninstall<CR>
  nnoremap <silent> <leader>mt :make test<CR>

  " Travel over errors.
  nnoremap <silent> <leader>ce <ESC>:cnext<CR>
  nnoremap <silent> <leader>cp <ESC>:cprevious<CR>
  nnoremap <silent> <leader>co <ESC>:cwindow<CR>
  nnoremap <silent> <leader>cf <ESC>:cfirst<CR>
  nnoremap <silent> <leader>cl <ESC>:clast<CR>
  nnoremap <silent> <leader>cx <ESC>:cclose<CR>
  nnoremap <silent> <leader>le <ESC>:lnext<CR>
  nnoremap <silent> <leader>lp <ESC>:lprevious<CR>
  nnoremap <silent> <leader>lo <ESC>:lwindow<CR>
  nnoremap <silent> <leader>lf <ESC>:lfirst<CR>
  nnoremap <silent> <leader>ll <ESC>:llast<CR>
  nnoremap <silent> <leader>lx <ESC>:lclose<CR>

  " Rewrite 'vhe' to 'vert help'.
  cnoremap vhe vert help

  " Let me write to sudo whenever possible.
  cnoremap sw% w !sudo tee %
endfun

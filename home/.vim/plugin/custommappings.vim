"{{{1 Plugin Mappings

nnoremap <F3> :Autoformat<CR><CR>

"{{{2 Tabularize
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
"}}}

"{{{2 Vimux
nnoremap <Leader>to :VimuxOpenPane<CR>
nnoremap <Leader>tp :VimuxPromptCommand<CR>
nnoremap <Leader>tt :VimuxRunLastCommand<CR>
nnoremap <Leader>tc :VimuxCloseRunner<CR>
vnoremap <Leader>ts "vy :call VimuxRepl()<CR>
nnoremap <Leader>ts vip<LocalLeader>ts<CR>

nnoremap <F6> :call ToggleColorScheme()<CR>

function! VimuxRepl()
  call VimuxSendText(@v)
  call VimuxSendKeys("<Enter>")
endfunction

function! ToggleColorScheme()
  if &background == "dark"
    call :airline#switch_theme("light")
    colorscheme Tomorrow
    set background=light
  else
    call :airline#switch_theme("dark")
    colorscheme Tomorrow-Night
    set background=dark
  endif
endfunction

"}}}

"}}}

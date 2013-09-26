" Key bindings are a developer's bread and butter. Over time, I remap and
" remap my keys to make my life as easy as possible. I've separated my generic
" mappings from my plug-in mappings intentionally, just for clarity.

" One less key to press to enter the Vim shell.
nnoremap ; :

" Toggle the use of list characters.
noremap <leader>i :set list!<cr>

" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>l :setlocal hlsearch!<CR>

" Toggle the state of spelling locally.
nnoremap <silent> <leader>j :setlocal spell!<CR>

" Toggle the visibility of cursor lines.
nnoremap <leader>c :setlocal cursorline!<CR>
nnoremap <leader>C :setlocal cursorcolumn!<CR>

" Toggle the current fold.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Inject the current date.
inoremap <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

" Inject the current time with the labelling of the time-zone.
inoremap <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>

" Inject the current date and time
inoremap <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>

" Disable classic arrow-key navigation in Normal mode.
noremap <Up>     <NOP>
noremap <Down>   <NOP>
noremap <Left>   <NOP>
noremap <Right>  <NOP>

" Edit and reload the master Vim configuration.
nnoremap <silent> <leader>ev :tabnew $MYVIMRC<cr> 
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" Jump between the current tabs.
noremap <silent> <C-H> :tabp<CR>
noremap <silent> <C-L> :tabn<CR>

" Formats the current buffer.
nnoremap <leader>f gg=G

" Bind make command.
nnoremap <leader>ba :make all<CR>
nnoremap <leader>bc :make clean<CR>
nnoremap <leader>bi :make install<CR>
nnoremap <leader>bu :make uninstall<CR>
nnoremap <leader>bt :make test<CR>

" Travel over errors.
nnoremap <leader>ce <ESC>:cn<CR>
nnoremap <leader>cp <ESC>:cp<CR>
nnoremap <leader>co <ESC>:cwindow<CR>
nnoremap <leader>cf <ESC>:cfirst<CR>
nnoremap <leader>cl <ESC>:clast<CR>

" Rewrite 'vhe' to 'vert help'.
cnoremap vhe vert help

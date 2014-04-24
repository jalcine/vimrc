" vim: set fdm=marker tw=78
" File:        plugin/mappings.vim
" Author:      Jacky Alciné <me@jalcine.me>
" Description: Mappings I'd use.

" {{{ Leaders and Accessibility
" Set my leader to the comma key.
let mapleader=','

" Set buffer-local mappings to the key above <Enter>
let maplocalleader='\\'

" One less hit to get to the command-line.
nnoremap ; :

" Disable classic arrow-key navigation in Normal mode.
nnoremap <Up>     <Nop>
nnoremap <Down>   <Nop>
nnoremap <Left>   <Nop>
nnoremap <Right>  <Nop>

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

" Strip trailing whitespace from the end of files.
nnoremap <silent> <leader>sw :%s/\s$//g<cr>

" Formats the current buffer.
nnoremap <leader>f gg=G

" Bind make command.
nnoremap <silent> <leader>m  :Make<CR>
nnoremap <silent> <leader>m<space>  :Make<space>
nnoremap <silent> <leader>ma :Make all<CR>
nnoremap <silent> <leader>mc :Make clean<CR>
nnoremap <silent> <leader>mi :Make install<CR>
nnoremap <silent> <leader>mu :Make uninstall<CR>
nnoremap <silent> <leader>mt :Make test<CR>
nnoremap <silent> <leader>mtb :call('Make',['test',expand('%')])<CR>

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
" }}}

nnoremap <silent> <leader><space> :Goyo<CR>
nnoremap <silent> <F4> :call mappings#toggle_bars()<CR>

" {{{ Unite mappings
func! mappings#call_unite(sources)
  exec(':Unite -quick-match ' . a:sources)
endfunc

func! mappings#call_unite_tasks()
  call mappings#call_unite('grep:.:-s:\(TODO\|todo\|NOTE\|note\|' .
        \ 'FIXME\|fixme\|BUG\bug)')
endfunc

func! mappings#toggle_bars()
  silent! :TagbarToggle
  silent! :NERDTreeToggle
  silent! :cwindow
endfunc

nnoremap <silent> <leader>pf :call mappings#call_unite('file_rec/async:!')<cr>
nnoremap <silent> <leader>pt :call mappings#call_unite_tasks()<cr>
nnoremap <silent> <leader>pb :call mappings#call_unite('buffer')<cr>
nnoremap <silent> <leader>pg :call mappings#call_unite('tag tag/include')<cr>
nnoremap <silent> <leader>px :call mappings#call_unite('tmux/panes tmux/sessions ' .
  \ 'tmux/windows')<cr>
" }}}
" {{{ Git helpers
nnoremap <leader>gc   :Git commit<space>
nnoremap <leader>gco  :Git checkout<space>
nnoremap <leader>gp   :Git push<space>
nnoremap <leader>gfa  :Git fetch --all<CR>
nnoremap <leader>gf   :Git fetch<space>
nnoremap <leader>grm  :Git rm %<CR>
nnoremap <leader>grmc :Git rm --cached %<CR>
nnoremap <leader>gab  :Git add %<cr>
nnoremap <leader>ga   :Git add<space>
" }}}

"{{{ Tabularize
vnoremap <leader>a: :Tabularize /:<CR>
vnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a{ :Tabularize /{<CR>
vnoremap <leader>a( :Tabularize /(<CR>
vnoremap <leader>a) :Tabularize /)<CR>
nnoremap <leader>a: :Tabularize /:<CR>
nnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a{ :Tabularize /{<CR>
nnoremap <leader>a( :Tabularize /(<CR>
nnoremap <leader>a) :Tabularize /)<CR>
"}}}

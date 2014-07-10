" vim: set fdm=marker tw=78
" File:        plugin/mappings.vim
" Author:      Jacky Alciné <me@jalcine.me>
" Description: Mappings I'd use.

" {{{ Leaders and Accessibility
" PASTE mo'fo!
set pastetoggle=<F2>

" Set my leader to the comma key.
let mapleader=','

" Set buffer-local mappings to the key above <Enter>
let maplocalleader='\\'

" One less hit to get to the command-line.
nnoremap ; :

" Disable classic arrow-key navigation in Normal mode.
" TODO: Move to personal configuration
"nnoremap <Up>     <Nop>
"nnoremap <Down>   <Nop>
"nnoremap <Left>   <Nop>
"nnoremap <Right>  <Nop>

" Toggle the use of list characters.
nnoremap <silent> <leader>l :set list!<cr>

" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>h :setlocal hlsearch!<CR>

" Toggle the state of spelling locally.
nnoremap <silent> <leader>j :setlocal spell!<CR>

" Toggle the current fold.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" {{{ Timing options
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

" Inject the current time with the labeling of the time-zone.
inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>

" Inject the current date and time (in Insert or Command mode).
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>
" }}}

" Strip trailing whitespace from the end of files.
nnoremap <silent> <leader>sw :%s/\s$//g<cr>

" Formats the current buffer.
nnoremap <leader>f :Autoformat<CR><CR>

" {{{ Bind make command.
nnoremap <silent> <leader>m  :Make<CR>
nnoremap <silent> <leader>m<space>  :Make<space>
nnoremap <silent> <leader>ma :Make all<CR>
nnoremap <silent> <leader>mc :Make clean<CR>
nnoremap <silent> <leader>mi :Make install<CR>
nnoremap <silent> <leader>mt :Make test<CR>
nnoremap <silent> <leader>mtb :call('Make',['test',expand('%')])<CR>
nnoremap <silent> <leader>mu :Make uninstall<CR>
" }}}

" {{{ Travel over errors.
nnoremap <silent> <leader>ce <ESC>:cnext<CR>
nnoremap <silent> <leader>cf <ESC>:cfirst<CR>
nnoremap <silent> <leader>cl <ESC>:clast<CR>
nnoremap <silent> <leader>co <ESC>:cwindow<CR>
nnoremap <silent> <leader>cp <ESC>:cprevious<CR>
nnoremap <silent> <leader>cx <ESC>:cclose<CR>
nnoremap <silent> <leader>le <ESC>:lnext<CR>
nnoremap <silent> <leader>lf <ESC>:lfirst<CR>
nnoremap <silent> <leader>ll <ESC>:llast<CR>
nnoremap <silent> <leader>lo <ESC>:lwindow<CR>
nnoremap <silent> <leader>lp <ESC>:lprevious<CR>
nnoremap <silent> <leader>lx <ESC>:lclose<CR>
" }}}

" {{{ tmux mappings
nnoremap <silent> <leader>tx <ESC>:TmuxSend<CR>
nnoremap <silent> <leader>ts <ESC>:TmuxSend<CR>
" }}}

" Rewrite 'vhe' to 'vert help'.
cnoremap vhe vert help

" Let me write to sudo whenever possible.
cnoremap sw% w !sudo tee %
" }}}

nnoremap <silent> <leader><space> :Goyo<CR>
nnoremap <silent> <F4> :call mappings#toggle_bars()<CR>

" {{{ Unite mappings
func! s:call_unite(sources)
  exec(':Unite -short-source-names -direction=botright ' . a:sources)
endfunc

func! s:call_unite_tasks()
  call mappings#call_unite('grep:.:-s:\(TODO\|todo\|NOTE\|note\|' .
        \ 'FIXME\|fixme\|BUG\bug)')
endfunc

func! s:toggle_bars()
  silent! :TagbarToggle
  silent! :NERDTreeToggle
  silent! :cwindow
  silent! :lwindow
endfunc

func! s:call_unite_tmux()
  call s:call_unite('tmux/panes tmux/sessions tmux/windows')
endfunc

func! s:call_unite_tags()
  call s:call_unite('tag tag/include')
endfunc

func! s:call_unite_buffer()
  call s:call_unite('buffer')
endfunc

func! s:call_unite_files()
  return s:call_unite('file_rec/async:!')
endfunc

func! s:call_unite_local_grep()
  return s:call_unite('grep:$PWD:-R')
endfunc

func! s:call_unite_resume()
  return s:call_unite('resume')
endfunc

" Define a base mapping for Unite.
nnoremap [unite] <nop>
nmap <leader>p [unite]

" Define the mappings.
nnoremap <silent> [unite]b :call <SID>call_unite_buffer()<cr>
nnoremap <silent> [unite]f :call <SID>call_unite_files()<cr>
nnoremap <silent> [unite]g :call <SID>call_unite_local_grep()<cr>
nnoremap <silent> [unite]t :call <SID>call_unite_tags()<cr>
nnoremap <silent> [unite]t :call <SID>call_unite_tasks()<cr>
nnoremap <silent> [unite]x :call <SID>call_unite_tmux()<cr>
nnoremap <silent> [unite]r :call <SID>call_unite_resume()<cr>
" }}}
" {{{ Git helpers
nnoremap <leader>ga   :Git add<space>
nnoremap <leader>gab  :Git add %<cr>
nnoremap <leader>gc   :Git commit<space>
nnoremap <leader>gco  :Git checkout<space>
nnoremap <leader>gf   :Git fetch<space>
nnoremap <leader>gfa  :Git fetch --all<CR>
nnoremap <leader>gp   :Git push<space>
nnoremap <leader>grm  :Git rm %<CR>
nnoremap <leader>grmc :Git rm --cached %<CR>
" }}}

"{{{ Tabularize
nnoremap <leader>a( :Tabularize /(<CR>
nnoremap <leader>a) :Tabularize /)<CR>
nnoremap <leader>a: :Tabularize /:<CR>
nnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a{ :Tabularize /{<CR>
vnoremap <leader>a( :Tabularize /(<CR>
vnoremap <leader>a) :Tabularize /)<CR>
vnoremap <leader>a: :Tabularize /:<CR>
vnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a{ :Tabularize /{<CR>
"}}}

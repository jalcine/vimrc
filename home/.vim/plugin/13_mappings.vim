" vim: set fdm=marker tw=78:
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

" Toggle the use of list characters.
nnoremap <silent> <leader>l :set list!<cr>

" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>h :setlocal hlsearch!<CR>

" Toggle the state of spelling locally.
nnoremap <silent> <leader>sp :setlocal spell!<CR>

" Toggle the current fold.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" {{{ Timing options
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

" Inject the current time with the labeling of the time-zone.
inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>

" Inject the current date and time (in Insert or Command mode).
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>
cnoremap <silent> <leader>pT <C-R>=strftime("%Y-%m-%d_%H%M%S")<CR>

" Inject the current date and time (in Insert or Command mode).
inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
" }}}

" Strip trailing whitespace from the end of files.
nnoremap <silent> <leader>sw :%s/\s$//g<cr>

" Formats the current buffer.
nnoremap <leader>f :Autoformat<CR><CR>

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

" {{{ Unite mappings
func! s:call_unite(sources)
  exec(':Unite -truncate ' . a:sources)
endfunc

func! s:call_unite_tasks()
  call s:call_unite('grep:.:-s:\(TODO\|todo\|NOTE\|note\|' .
    \ 'FIXME\|fixme\|BUG\|bug)')
endfunc

func! s:call_unite_tmux()
  call s:call_unite('tmux/panes tmux/sessions tmux/windows ' .
    \ 'tmuxcomplete/lines')
endfunc

func! s:call_unite_tags()
  call s:call_unite('tag tag/include')
endfunc

func! s:call_unite_buffer()
  call s:call_unite('buffer')
endfunc

func! s:call_unite_files()
  return s:call_unite('file_rec:$PWD')
endfunc

func! s:call_unite_local_grep()
  return s:call_unite('grep:.:-R')
endfunc

func! s:call_unite_resume()
  return s:call_unite('resume')
endfunc

" Define a base mapping for Unite.
nnoremap [unite] <nop>
nmap <leader>u [unite]

" Define the mappings.
nnoremap <silent> [unite]b :call <SID>call_unite_buffer()<cr>
nnoremap <silent> [unite]f :call <SID>call_unite_files()<cr>
nnoremap <silent> [unite]g :call <SID>call_unite_local_grep()<cr>
nnoremap <silent> [unite]t :call <SID>call_unite_tags()<cr>
nnoremap <silent> [unite]t :call <SID>call_unite_tasks()<cr>
nnoremap <silent> [unite]x :call <SID>call_unite_tmux()<cr>
nnoremap <silent> [unite]r :call <SID>call_unite_resume()<cr>
nnoremap <silent> [unite]X :call <Plug>unite_disable_max_candidates()<CR>

" For those who end up using my machine but think it has CtrlP.
nnoremap <silent> <leader>p [unite]f
" }}}

" {{{ Git helpers
nnoremap [git] <nop>
nmap <leader>g [git]
nnoremap <silent> [git]a   :Git add<space>
nnoremap <silent> [git]ab  :Git add %<cr>
nnoremap <silent> [git]c   :Git commit<space>
nnoremap <silent> [git]co  :Git checkout<space>
nnoremap <silent> [git]f   :Git fetch<space>
nnoremap <silent> [git]fa  :Git fetch --all<CR>
nnoremap <silent> [git]p   :Git push<space>
nnoremap <silent> [git]rm  :Git rm %<CR>
nnoremap <silent> [git]rmc :Git rm --cached %<CR>
" }}}

"{{{ Tabularize
nnoremap [tabular] <nop>
nmap <leader>a [tabular]
nnoremap <silent> [tabular]( :Tabularize /(<CR>
nnoremap <silent> [tabular]) :Tabularize /)<CR>
nnoremap <silent> [tabular]: :Tabularize /:<CR>
nnoremap <silent> [tabular]= :Tabularize /=<CR>
nnoremap <silent> [tabular]{ :Tabularize /{<CR>
xnoremap <silent> [tabular]( :Tabularize /(<CR>
xnoremap <silent> [tabular]) :Tabularize /)<CR>
xnoremap <silent> [tabular]: :Tabularize /:<CR>
xnoremap <silent> [tabular]= :Tabularize /=<CR>
xnoremap <silent> [tabular]{ :Tabularize /{<CR>
"}}}

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

" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>h :setlocal hlsearch!<cr>

" Toggle the state of spelling locally.
nnoremap <silent> <leader>sp :setlocal spell!<cr>

" Toggle the visibilty of non-text characters and conceals.
nnoremap <silent> <leader>k :call s:toggle_visibility()<cr>

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

" {{{ tmux mappings
nnoremap [tmux] <nop>
nmap <leader>t [tmux]
nnoremap <silent> [tmux]s <ESC>:TmuxSend<CR>
nnoremap <silent> [tmux]c <ESC>:TmuxChangeCommand<CR>
nnoremap <silent> [tmux]S <ESC>:TmuxSendCommand<CR>
nnoremap <silent> [tmux]p <ESC>:TmuxSelectPane<CR>
" }}}

" Drop into the shell quick as hell.
cnoremap !sh :shell<CR>

" Rewrite 'vhe' to 'vert help'.
cnoremap vhe vert help

" Let me write to sudo whenever possible.
cnoremap sw% w !sudo tee %
" }}}

" {{{ Unite mappings
func! s:call_unite(sources)
  exec(':Unite -unique -toggle -no-hide-icon -truncate ' . a:sources)
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
  call s:call_unite('tag:$PWD tag/include:$PWD')
endfunc

func! s:call_unite_buffer()
  call s:call_unite('buffer')
endfunc

func! s:call_unite_files()
  return s:call_unite('file_rec/async')
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
nnoremap <silent> [unite]<space> :call <SID>call_unite_resume()<cr>
nnoremap <silent> [unite]b :call <SID>call_unite_buffer()<cr>
nnoremap <silent> [unite]f :call <SID>call_unite_files()<cr>
nnoremap <silent> [unite]g :call <SID>call_unite_local_grep()<cr>
nnoremap <silent> [unite]t :call <SID>call_unite_tags()<cr>
nnoremap <silent> [unite]a :call <SID>call_unite_tasks()<cr>
nnoremap <silent> [unite]x :call <SID>call_unite_tmux()<cr>
nnoremap <silent> [unite]u :call <SID>call_unite('ultisnips')<cr>
nnoremap <silent> [unite]X :call <Plug>unite_disable_max_candidates()<CR>

" For those who end up using my machine but think it has CtrlP.
nnoremap <silent> <leader>p :call <SID>call_unite_files()<cr>
" }}}

" {{{ Git helpers
nnoremap [git] <nop>
nmap <leader>g [git]
nnoremap <silent> [git]a   :Git add<space>
nnoremap <silent> [git]ab  :Git add %<cr>
nnoremap <silent> [git]c   :Git commit<space>
nnoremap <silent> [git]C   :Gcommit --branch --verbose %<CR>
nnoremap <silent> [git]co  :Git checkout<space>
nnoremap <silent> [git]f   :Git fetch<space>
nnoremap <silent> [git]fa  :Git fetch --all<CR>
nnoremap <silent> [git]p   :Git push<space>
nnoremap <silent> [git]rm  :Gremove %<CR>
nnoremap <silent> [git]rmc :Git rm --cached %<CR>
" }}}

"{{{ Tabularize
" There's a lot of expressions that should/could be added as default.
if exists('g:tabular_loaded')
  " FIXME: Move most expressions into patterns for Tabular.
  nnoremap [tabular] <nop>
  nmap <leader>a [tabular]
  nnoremap <silent> [tabular]( :Tabularize /(<CR>
  nnoremap <silent> [tabular]) :Tabularize /)<CR>
  nnoremap <silent> [tabular]: :Tabularize /:<CR>
  nnoremap <silent> [tabular]= :Tabularize /=<CR>
  nnoremap <silent> [tabular]{ :Tabularize /{<CR>
  nnoremap <silent> [tabular]| :Tabularize /|<CR>
  xnoremap <silent> [tabular]( :Tabularize /(<CR>
  xnoremap <silent> [tabular]) :Tabularize /)<CR>
  xnoremap <silent> [tabular]: :Tabularize /:<CR>
  xnoremap <silent> [tabular]= :Tabularize /=<CR>
  xnoremap <silent> [tabular]{ :Tabularize /{<CR>
  xnoremap <silent> [tabular]| :Tabularize /|<CR>
endif
"}}}

" Swap for emoji
nnoremap <silent> <leader>emo %s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>

func! s:toggle_visibility()
  setlocal list!
  if &conceallevel != 0
    setlocal conceallevel=0
  else
    setlocal conceallevel=2
  endif
endfunc

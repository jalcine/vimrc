" vim: set fdm=marker foldenable foldlevel=0 nospell:
" File:          .nvimrc
" Author:        Jacky Alciné <yo@jacky.wtf>
" Description:   The heart for Neovim.
" Last Modified: 2015-01-03 15:51:04 EST
"
" This is my peronal setup for NeoVim. It works ~exactly~ the
" way I expect it to. Any different would trip me up.

" UTF-8 NWA style
scriptencoding utf-8

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set t_Co=256

set laststatus=2
set number relativenumber
set path=.,/usr/local/include,/usr/include,$HOME/.local/include
set visualbell
set errorbells
set ruler
set number
set conceallevel=1 concealcursor=nv
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set textwidth=80
set wrap
call matchadd('ColorColumn', '\%' . &textwidth . 'v', 81)

set complete=.,w,b,u,U,i,d,t
set completeopt=menu,longest

set showmatch wrapscan
set nogdefault noignorecase
set showcmd
set showfulltag
set showmatch

set wildmenu wildmode=longest:full
set wildoptions=tagfile
set wildignorecase

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*
set wildignore+=node_modules/*

" Complete with more things.
set complete=.,w,b,u,U,i,d,t
set completeopt=menu,longest

set foldenable
set foldmethod=syntax
set foldcolumn=1
set foldlevel=0
set foldminlines=3
set foldnestmax=5
set foldlevelstart=3

set spelllang=en_us
set spellsuggest=best,3
set dictionary+=/usr/share/dict/words,
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/web2,
set dictionary+=/usr/share/dict/propernames.gz
set dictionary+=/usr/share/dict/connectives.gz
set dictionary+=/usr/share/dict/web2a.gz
set spellfile=~/.nvim/dict.custom.utf-8.add

"{{{ White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

" Visual cues when in 'list' model.
set list
set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\ 

" Keep some spacing.
set sidescrolloff=1
"}}}

" {{{ abbreviations
" {{{ Identifiers
iabbrev me_email yo@jacky.wtf
iabbrev me_name Jacky Alciné
iabbrev me_fname Jacky
iabbrev me_lname Alciné
iabbrev me_site https://jacky.wtf
" }}}
" {{{ Constant Typos
iabbrev fucntion function
iabbrev sesssion session
iabbrev existant existent
iabbrev existance existence
iabbrev inlcude include
iabbrev conifg config
" }}}
" {{{ Lingo
iabbrev afaik as far as I know
iabbrev tbh to be honest
iabbrev afaics as far as I can see
iabbrev lgtm looks good to me
" }}}
" {{{ Sites
iabbrev bko bugs.kde.org
iabbrev bmo bugs.mozilla.org
iabbrev blp launchpad.net
" }}}
" {{{ Projects
iabbrev ggl google
iabbrev ghb github
iabbrev glb gitlab
iabbrev lnx linux
iabbrev wntr wintermute
iabbrev Wntr Wintermute
" }}}
" }}}

" {{{ Mappings

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

nnoremap <silent> <F2> setlocal paste!<cr>

" Cold turkey; no more arrows motions.
nnoremap <silent> <up>    <nop>
nnoremap <silent> <down>  <nop>
nnoremap <silent> <left>  <nop>
nnoremap <silent> <right> <nop>

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
  exec(':Unite -unique -toggle -no-hide-icon -no-empty -immediately -truncate ' . a:sources)
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

function! s:call_unite_snippets()
  return s:call_unite('ultisnips')
endfunction


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
nnoremap <silent> [unite]u :call <SID>call_unite_snippets()<cr>
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

" {{{ testing
nnoremap [vimtest] <nop>
nmap <leader>t [vimtest]
nnoremap <silent> [vimtest]t :TestNearest<CR>
nnoremap <silent> [vimtest]T :TestFile<CR>
nnoremap <silent> [vimtest]a :TestSuite<CR>
nnoremap <silent> [vimtest]l :TestLast<CR>
nnoremap <silent> [vimtest]g :TestVisit<CR>
" }}}

func! s:toggle_visibility()
  setlocal list!
  if &conceallevel != 0
    setlocal conceallevel=0
  else
    setlocal conceallevel=2
  endif
endfunc

" Toggle the visibilty of non-text characters and conceals.
nnoremap <silent> <leader>k :call <SID>toggle_visibility()<cr>

" }}}

" {{{ Plugin Options

"let g:github_access_token = readfile('~/.github-issues-vim')

let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_directory = '~/.nvim/sessions'

let g:easytags_async = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_dynamic_files = 1

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:test_strategy = 'neovim'

" {{{ neomake options
let g:neomake_open_list = 2
let g:neomake_serialize = 1
let g:neomake_verbose = 1
let g:neomake_javascript_enabled_checkers = ['jshint', 'jscs', 'eslint']
let g:neomake_javascript_jscs_options = '--esnext'
" }}}

" {{{ vim-airline options
let g:airline_theme = 'tomorrow'
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'B'
      \ }
" }}}

" {{{ unite options
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = '~/.vim/cache-unite'
let g:unite_source_rec_max_cache_files = 1000
let g:unite_source_grep_max_candidates = 500
let g:unite_enable_start_insert = 1
" }}}

" {{{ nerd*
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDCompactSexyComs = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeShowBookmarks = 1
" }}}

" {{{ ultisnips
let g:snips_author = 'Jacky Alciné <yo@jacky.wtf>'
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories = ['Ultisnips']
" }}}


let g:vimsyn_folding='afpPr'
let g:vimsyn_embed='Pr'

" }}}

" {{{ plugins

" Set up vim-plug ▶️ https://github.com/junegunn/vim-plug#example

call g:plug#begin('~/.nvim/plugins')

Plug 'tpope/vim-dispatch'
Plug 'benekastah/neomake'
Plug 'bruno-/vim-man'
Plug 'janko-m/vim-test'
Plug 'bling/vim-airline'
Plug 'mattn/webapi-vim'
Plug 'jalcine/cmake.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'int3/vim-extradite'
Plug 'SyntaxRange'
Plug 'TagHighlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'gorodinskiy/vim-coloresque'
Plug 'guns/xterm-color-table.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/vim-slack'
Plug 'honza/vim-snippets'
Plug 'marijnh/tern_for_vim'
Plug 'mattn/gist-vim'
Plug 'mmozuras/vim-github-comment'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-surround'
Plug 'tsukkee/unite-tag'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-publish'
Plug 'xolox/vim-session'
Plug 'xolox/vim-shell'
Plug 'yuku-t/unite-git'
Plug 'zepto/unite-tmux'
Plug 'junegunn/vim-emoji'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'easymotion/vim-easymotion'
Plug 'isRuslan/vim-es6'
Plug 'elixir-lang/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'jaxbot/github-issues.vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'Chiel92/vim-autoformat'
Plug 'KabbAmine/vCoolor.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc'
Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/unite.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'mustache/vim-mustache-handlebars'
Plug 'aperezdc/vim-template'
Plug 'dsawardekar/ember.vim'
Plug 'embear/vim-localvimrc'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'twilight256.vim'

call g:plug#end()

" }}}

" {{{ personal augroup mods
func! s:reload_tmux()
  redraw | echomsg '[tmux -> vim] Sourced ' . expand('%:p') . '.' | redraw
  call system('tmux source-file ' . expand('%:p') . '; tmux display-message ' .
        \ '"[tmux <- vim] Sourced ' . expand('%:p') . '"')
endfunc

augroup jalcine
  au!

  " Funky files.
  au BufReadPre *cpanfile   let &ft='perl'
  au BufReadPre *pintofile  let &ft='perl'
  au BufReadPre *.h++       let &ft='cpp'
  au BufReadPre /usr/include/c++/* let &ft='cpp'
  au BufReadPre *.gdb       let &ft='gdb'
  au BufEnter   *           let &titlestring=expand('%:p')
  au BufRead    *jscsrc     let &ft='json'
  au BufRead    *jshintrc   let &ft='json'
  au BufWritePost * Neomake
  au User YouCompleteMe call youcompleteme#Enable()

  au BufWritePost *tmux*.conf call s:reload_tmux()
  auto FileType unite call s:configure_unite_buffer()

  " Make sure we don't spell in certain windows.
  au QuickFixCmdPre * set nospell
augroup END
" }}}

" {{{ Tweaking Unite
call g:unite#filters#matcher_default#use([
  \ 'matcher_context',
  \ 'matcher_project_files',
  \ 'matcher_project_ignore_files',
  \ 'matcher_hide_current_file'
  \ ])

call g:unite#filters#sorter_default#use([
  \ 'sorter_rank',
  \ 'sorter_ftime'
  \ ])

call g:unite#filters#converter_default#use([
  \ 'converter_smart_path'
  \ ])

call g:unite#custom#profile('source/grep', 'context', {
  \   'quit' : 1
  \ })

call g:unite#custom#profile('default', 'context', {
  \   'start_insert': 1,
  \   'winheight': 10,
  \   'direction': 'botright',
  \   'auto-resize': 1
  \ })


func! s:configure_unite_buffer()
  imap <silent><buffer><expr> <C-j>   <Plug>(unite_select_next_line)<CR>
  imap <silent><buffer><expr> <C-k>   <Plug>(unite_select_previous_line)<CR>
  imap <silent><buffer><expr> <C-p>   <Plug>(unite_auto_preview)<CR>
  imap <silent><buffer><expr> <C-s>   unite#do_action('split')<CR>
endfunc
" }}}

" {{{ color
colorscheme twilight256
set background=dark
hi FoldColumn ctermbg=NONE
hi LineNr ctermbg=NONE
hi SignColumn ctermbg=NONE
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi Folded ctermbg=NONE
" }}}

syntax enable
filetype plugin indent on

" vim: set fdm=marker foldenable foldlevel=1 nospell:
" File:          .config/nvim/init.vim
" Author:        Jacky Alciné <yo@jacky.wtf>
" Description:   The heart for Neovim.
" Last Modified: 2015-11-02 22:33:39 PST
"
" This is my peronal setup for NeoVim. It works ~exactly~ the
" way I expect it to. Any different would trip me up.
"
" Some stuff for Vint.
" vint: -ProhibitUnnecessaryDoubleQuote

" UTF-8 NWA style
set encoding=utf-8
scriptencoding utf-8

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1


" {{{ Options
set laststatus=2
set number relativenumber numberwidth=1
set path=.,/usr/local/include,/usr/include,$HOME/.local/include
set visualbell
set errorbells
set ruler
set conceallevel=1 concealcursor=nv
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set textwidth=80
set nowrap
call matchadd('ColorColumn', '\%' . &textwidth . 'v', 80)

set complete=.,w,b,u,U,i,d,t
set completeopt=menu,longest


set cursorline cursorcolumn

set showmatch wrapscan
set nogdefault noignorecase
set showcmd
set showfulltag
set showmatch
set modeline modelines=5
set noshelltemp
set tabline=0
set backspace=indent,eol,start

set wildmenu wildmode=longest:full
set wildoptions=tagfile
set wildignorecase

set matchtime=6
set maxcombine=4

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*,*node_modules/*,*/target/*

set nobackup noswapfile
set undofile undodir=~/.config/nvim/undodir

set cpoptions+=d

set foldenable
set foldcolumn=1
set foldlevel=1
set foldminlines=3
set foldnestmax=5
set foldlevelstart=1

set spelllang=en_us
set spellsuggest=best,3
set dictionary+=/usr/share/dict/words,
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/web2,
set dictionary+=/usr/share/dict/propernames.gz
set dictionary+=/usr/share/dict/connectives.gz
set dictionary+=/usr/share/dict/web2a.gz
set spellfile=~/.config/nvim/dict.custom.utf-8.add

set splitbelow splitright

set cinoptions+='JN'

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" }}}

" {{{2 White spacing and Characters
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

" {{{2 abbreviations
" {{{ Identifiers
iabbrev me_email yo@jacky.wtf
iabbrev me_name Jacky Alciné
iabbrev me_fname Jacky
iabbrev me_lname Alciné
iabbrev me_site https://jacky.wtf
" FIXME: Make this appear in Python files only.
iabbrev s. self.
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
" {{{ Shit I Fuck up A log
iabbrev _repo repository
iabbrev NOne None
" }}}
" }}}

" {{{ Commands
" Just in case.
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
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

nnoremap <silent> <leader>ei :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<cr>

" Formats the current buffer.
nnoremap <silent><F3> :Autoformat<CR><CR>

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
nnoremap <silent> [git]r    :Greview<cr>
nnoremap <silent> [git]v :Gitv<CR>
nnoremap <silent> [git]V :Gitv!<CR>
" }}}

" {{{ testing
nnoremap [vimtest] <nop>
nmap <leader>v [vimtest]
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

" Quickly searches using the awesome stuff.
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" {{{ unite
func! s:call_unite(sources)
  exec(':Unite -match-input -immediately ' . a:sources)
endfunc

func! s:call_unite_history()
  call s:calL_unite('history/yank')
endfunc

func! s:call_unite_tmux()
  call s:call_unite('tmux/panes tmux/sessions tmux/windows')
endfunc

func! s:call_unite_tasks()
  call s:call_unite('grep:.:-s:\(TODO\|todo\|NOTE\|note\|' .
        \ 'FIXME\|fixme\|BUG\|bug)')
endfunc

func! s:call_unite_grep()
  call s:call_unite('grep:.')
endfunc

func! s:call_unite_buffer()
  call s:call_unite('-quick-match buffer')
endfunc

func! s:call_unite_files()
  call s:call_unite('file_rec/async')
endfunc

func! s:call_unite_tags()
  call s:call_unite('tag:$PWD tag/include:$PWD')
endfunc

function! s:call_unite_snippets()
  return s:call_unite('ultisnips')
endfunc

nnoremap [unite] <nop>
nmap <leader>u [unite]
nnoremap <silent> [unite]b :call <SID>call_unite_buffer()<cr>
nnoremap <silent> [unite]f :call <SID>call_unite_files()<cr>
nnoremap <silent> [unite]t :call <SID>call_unite_tags()<cr>
nnoremap <silent> [unite]a :call <SID>call_unite_tasks()<cr>
nnoremap <silent> [unite]x :call <SID>call_unite_tmux()<cr>
nnoremap <silent> [unite]u :call <SID>call_unite_snippets()<cr>
nnoremap <silent> [unite]X :call <Plug>unite_disable_max_candidates()<CR>
nnoremap <silent> <leader>p :call <SID>call_unite_files()<cr>
" }}}

" }}}

" {{{ Plugin Options
let g:javaScript_fold=1
let g:perl_fold=1
let g:php_folding=1
let g:r_syntax_folding=1
let g:ruby_fold=1
let g:sh_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding=1
let g:javascript_conceal = 1
let g:xml_syntax_folding = 1
let g:xml_namespace_transparent = 1
let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.markdown'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_define_wrapper_commands = 1
let g:javascript_enable_domhtmlcss = 1
let g:javascript_fold = 1
let g:javascript_conceal_function = 'ƒ'
let g:javascript_conceal_null = 'ø'
let g:javascript_conceal_this = '@'
let g:javascript_conceal_return = '⇚'
let g:javascript_conceal_undefined = '¿'
let g:javascript_conceal_NaN = 'ℕ'
let g:javascript_conceal_prototype = '¶'
let g:javascript_conceal_static = '•'
let g:javascript_conceal_super = 'Ω'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:deoplete#enable_at_startup = 1
let g:signify_update_on_bufenter = 0
let g:rustfmt_autosave = 1
let g:gitgutter_diff_args = '-w'
let g:github_user = 'jalcine'
let g:github_comment_open_browser = 1
let g:tagbar_left=1
let g:tagbar_compact=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=0
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autoshowtag=1
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3',
    \ 'l:Heading_L4',
    \ 'm:Heading_L5',
    \ 'n:Heading_L6'
  \ ]
\ }
let g:ycm_complete_in_comments_and_strings=1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_filetype_blacklist={'unite': 1}
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:polyglot_disabled = ['coffee']

let g:jsdoc_additional_descriptions = 1
let g:jsdoc_access_descriptions = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_allow_shorthand = 1
let g:localvimrc_name = [ '.vimrc' ]
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

let s:custom_header =
      \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

func! s:filter_header(lines) abort
  let l:longest_line = max(map(copy(a:lines), 'len(v:val)'))
  let l:centered_lines= map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (l:longest_line / 2)) . v:val')
  return l:centered_lines
endfunc

let g:startify_custom_header = s:filter_header(s:custom_header)
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0
let g:startify_relative_path = 1
let g:startify_bookmarks = [ '~/.config/nvim/init.vim', '~/.bashrc', '~/prjs' ]
let g:startify_session_dir = '~/.config/nvim/sessions'

let g:localvimrc_persistent = 1

let g:easytags_async = 1
let g:easytags_syntax_keyword = 'always'
let g:easytags_dynamic_files = 1
let g:easytags_languages = {
      \ 'javascript': {
      \   'cmd': 'jsctags',
      \   'args': [],
      \   'fileoutput_opt': '-f',
      \   'stdout_opt': '-f-',
      \   'recurse_flag': '-R'
      \   }
      \ }

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 5
let g:indent_guides_color_change_percent = 2
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 'tagbar']

let g:doxygen_enhanced_color = 1
let g:load_doxygen_syntax = 1
let g:c_no_comment_fold = 1

let g:test#strategy = 'neovim'
let g:test#preserve_screen = 1

" TODO: Add this: https://github.com/janko-m/vim-test#transformations

" {{{ neomake options
let g:neomake_list_height = 3
let g:neomake_open_list = 0
let g:neomake_serialize = 0
let g:neomake_serialize_abort_on_error = 1
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_checkers = ['eslint', 'jscs']
let g:neomake_python_enabled_checkers = ['python', 'flake8']
let g:neomake_scss_enabled_checkers = ['scss-lint']
let g:neomake_sh_enabled_checkers = ['shellcheck']
let g:neomake_ruby_enabled_checkers = ['rubocop', 'mri']
let g:neomake_vim_enabled_checkers = ['vint']
" }}}

" {{{ vim-airline options
let g:airline_theme = 'jellybeans'
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'B'
      \ }
" }}}

" {{{ nerd*
let g:NERDCreateDefaultMappings = 1
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1
" }}}

" {{{ ultisnips
let g:snips_author = 'Jacky Alciné <yo@jacky.wtf>'
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories = ['Ultisnips']
" }}}

" {{{ vim-bookmarks
let g:bookmark_sign = '☰'
let g:bookmark_highlight_lines = 1
" "}}

" {{{ ag
let g:ag_prg="ag --vimgrep --smart-case --noheading"
let g:ag_highlight=1
" }}}

let g:vimsyn_folding='afpPr'
let g:vimsyn_embed='Pr'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" }}}

" {{{ personal augroup mods
func! s:reload_tmux()
  redraw | echomsg '[tmux ➡️  vim] Sourced ' . expand('%:p') . '.' | redraw
  call system('tmux source-file ' . expand('%:p') . '; tmux display-message ' .
        \ '"[tmux ⬅️  vim] Sourced ' . expand('%:p') . '"')
endfunc

function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <esc> <plug>(unite_exit)
endfunction

augroup jalcine
  au!

  " Funky files.
  au User YouCompleteMe call youcompleteme#Enable()

  " Reload tmux files when we edit them.
  au BufWritePost *tmux*.conf  call s:reload_tmux()
  au BufWritePost *tmux/*.conf call s:reload_tmux()

  " Tweak for particular file types.
  au FileType css setl iskeyword+=-
  au FileType gitcommit setl spell
  au FileType markdown call textobj#quote#init()

  " Enable Neomake to run on builds.
  au BufWritePost * Neomake
  au BufReadPost  * Neomake

  " Clear Fugitive buffers.
  au BufReadPost fugitive://* set bufhidden=delete

  " Focus.
  au WinLeave * setlocal nocursorline nocursorcolumn
  au WinEnter * setlocal cursorcolumn cursorline

  " Things for Unite
  au FileType unite call s:unite_settings()

  " CoffeeScript jazz.
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent shiftwidth=2 expandtab

  au FileType css,scss setlocal foldmethod=marker foldmarker={,}
  au FileType css,scss nnoremap <silent> <leader>S vi{:sort<CR>
  au FileType python setlocal foldmethod=indent
  au FileType markdown setlocal nolist
  au FileType vim setlocal fdm=indent keywordprg=:help
augroup END
" }}}

" {{{ unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command = "ag"
let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --nocolor --nogroup --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''

let g:unite_source_rec_max_cache_files = 8000
let g:unite_prompt = '» '
" }}}

if filereadable(expand("$HOME/.config/nvim/local.vim"))
  source $HOME/.config/nvim/local.vim
endif
" }}}

" {{{ plugins

" Set up vim-plug ▶️  https://github.com/junegunn/vim-plug#example

call g:plug#begin('~/.config/nvim/plugins')

Plug 'Chiel92/vim-autoformat'
Plug 'KabbAmine/zeavim.vim'
Plug 'Konfekt/FastFold'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'TagHighlight'
Plug 'benekastah/neomake'
Plug 'benmills/vimux'
Plug 'bogado/file-line'
Plug 'bruno-/vim-man'
Plug 'dsawardekar/ember.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'flazz/vim-colorschemes'
Plug 'gorodinskiy/vim-coloresque'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/vim-slack'
Plug 'honza/vim-snippets'
Plug 'int3/vim-extradite'
Plug 'isRuslan/vim-es6'
Plug 'janko-m/vim-test'
Plug 'jaxbot/github-issues.vim'
Plug 'jceb/vim-orgmode'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/vim-emoji'
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kopischke/vim-stay'
Plug 'lukaszkorecki/CoffeeTags'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'merlinrebrovic/focus.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'mmozuras/vim-github-comment'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mtscout6/vim-cjsx', { 'for': 'coffee' }
Plug 'mustache/vim-mustache-handlebars', { 'for' : 'mustache' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'reedes/vim-textobj-quote'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot', { 'do': './build' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-heroku'
Plug 'tpope/vim-jdaddy', { 'for': 'json' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-publish'
Plug 'xolox/vim-shell'
Plug 'gregsexton/gitv'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }
Plug 'Shougo/neomru.vim'
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py', 'frozen': 1 }
Plug 'justinmk/vim-sneak'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/unite-help'
Plug 'Shougo/unite-outline'
Plug 'zepto/unite-tmux'

call g:plug#end()

" }}}

" {{{ Final tweaks

filetype plugin indent on
syntax enable

" {{{ Colorscheme
set background=dark
colorscheme distinguished
hi BookmarkLineDefault ctermfg=white ctermbg=33
hi VendorPrefix ctermbg=white ctermbg=blue
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
" }}}

" {{{ post-work for unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1
      \ })
call g:unite#filters#matcher_default#use([
      \ 'matcher_context',
      \ 'matcher_fuzzy',
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
      \   'auto-resize': 0,
      \   'winheight': 5,
      \   'direction': 'top'
      \ })

call g:unite#custom#source('tag,file_rec/async', 'ignore_globs',
      \ split(&wildignore, ','))

func! s:configure_unite_buffer()
  imap <silent><buffer><expr> <C-j>   <Plug>(unite_select_next_line)<CR>
  imap <silent><buffer><expr> <C-k>   <Plug>(unite_select_previous_line)<CR>
  imap <silent><buffer><expr> <C-p>   <Plug>(unite_auto_preview)<CR>
  imap <silent><buffer><expr> <C-s>   unite#do_action('split')<CR>
endfunc
" }}}
" }}}

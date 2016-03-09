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

" {{{ plugins

" Set up vim-plug ▶️  https://github.com/junegunn/vim-plug#example

call g:plug#begin('~/.config/nvim/plugins')

Plug 'Chiel92/vim-autoformat'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'SirVer/ultisnips'
Plug 'TagHighlight'
Plug 'benekastah/neomake'
Plug 'bogado/file-line'
Plug 'bruno-/vim-man'
Plug 'ctrlpvim/ctrlp.vim'
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
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'jaxbot/github-issues.vim'
Plug 'jceb/vim-orgmode'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/vim-emoji'
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'merlinrebrovic/focus.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'mmozuras/vim-github-comment'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'mtscout6/vim-cjsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'reedes/vim-textobj-quote'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'saltstack/salt-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'sheerun/vim-polyglot'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-publish'
Plug 'xolox/vim-shell'
Plug 'kopischke/vim-stay'
Plug 'Konfekt/FastFold'
Plug 'Shougo/deoplete.nvim'
Plug 'StanAngeloff/php.vim'

call g:plug#end()

" }}}

" {{{ Options
set laststatus=2
set number relativenumber
set path=.,/usr/local/include,/usr/include,$HOME/.local/include
set visualbell
set errorbells
set ruler
set number numberwidth=2
set conceallevel=1 concealcursor=nv
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set textwidth=80
set nowrap
call matchadd('ColorColumn', '\%' . &textwidth . 'v', 80)

set complete=.,w,b,u,U,i,d,t
set completeopt=menu,longest
set nobackup noswapfile

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
set wildignore+=.sass-cache/*,*node_modules/*,*/target/*

set undodir=~/.config/nvim/undodir
set undofile

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

set cinoptions+='JN'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
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

" {{{ CtrlP
" Search across tags
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
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

let g:test_strategy = 'neovim'

" {{{ neomake options
let g:neomake_list_height = 3
let g:neomake_open_list = 0
let g:neomake_serialize = 0
let g:neomake_serialize_abort_on_error = 1
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_checkers = ['eslint', 'jscs']
let g:neomake_python_enabled_checkers = ['pyflakes', 'pylint', 'python', 'pep8', 'flake8']
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
let g:airline#extensions#tabline#enabled = 1
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

" {{{ ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp_search = 1
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_show_hidden=1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix',
      \ 'line', 'mixed']
let g:ctrlp_tjump_only_silent = 1
let g:ctrlp_tjump_skip_tag_name = 1
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

augroup jalcine
  au!

  " Funky files.
  au User YouCompleteMe call youcompleteme#Enable()

  au BufWritePost *tmux*.conf  call s:reload_tmux()
  au BufWritePost *tmux/*.conf call s:reload_tmux()

  " Make sure we don't spell in certain windows.
  au FileType css setl iskeyword+=-
  au FileType gitcommit setl spell
  au FileType markdown call textobj#quote#init()

  " Enable Neomake to run on builds.
  autocmd! BufWritePost * Neomake
  autocmd! BufReadPost * Neomake
augroup END
" }}}

if filereadable(expand("$HOME/.config/nvim/local.vim"))
  source $HOME/.config/nvim/local.vim
endif

colorscheme jellybeans
filetype plugin indent on
syntax enable
hi Folded ctermbg=NONE
hi FoldColumn ctermbg=NONE
hi SignColumn ctermbg=NONE

" File: config/init.vim
" Author: Jacky Alcine <yo@jacky.wtf>
" Description: Entry point of all of my configuration.
" Last Modified: August 08, 2017

" A bit easier on my hands.
let mapleader=','

" We'll start with plugin support.
filetype plugin indent on
syntax on
set ruler
set number relativenumber
set termguicolors guicursor=

" {{{ White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

set regexpengine=1

set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\ 

" Keep some spacing and make each buffer its own thing.
set sidescrolloff=1
set nowrap
"}}}

" Hide some things from me. I don't need to know everything.
set conceallevel=2 concealcursor=nvci

if executable('ag')
 set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
 set grepformat=%f:%l:%c:%m
endif

if exists('$NVIM_VERBOSE')
 set verbose=10 verbosefile=~/.config/nvim/logs/runtime.log
endif

" Let's keep it i18n-friendly.
set encoding=utf-8

" Good chance I'd want to know what I wrote 3 weeks ago.
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=1000

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

" I tend to work on machines with fast terminal support.
set laststatus=2
set incsearch

set tabstop=2 softtabstop=2
set shiftwidth=2 textwidth=100
set smarttab expandtab
set shiftround

" Fold away my code.
set foldenable foldcolumn=1 foldlevel=1 foldmethod=syntax

set ignorecase smartcase

set nocscopetag
set tags=tags,.tags

" Set up plugins.
call plug#begin('~/.config/nvim/plugins')

" Tim knows what's he's doing here.
Plug 'tpope/vim-sensible'

" Repeat anything (and everything).
Plug 'tpope/vim-repeat'

" Asynchronous `:make` support tailored for languages.
Plug 'benekastah/neomake'

" Asynchronous testing support for particular languages.
Plug 'janko-m/vim-test'

Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rsi'
 \ | Plug 'vim-utils/vim-husk'

" For example, a motion-orientated commenting tool and an extension that makes it easy to box up
" those comments.
Plug 'tpope/vim-commentary' 
 \ | Plug 'cbaumhardt/vim-commentary-boxed'

" Get some shell and notes support popping.
Plug 'xolox/vim-misc'
 \ | Plug 'xolox/vim-notes'
 \ | Plug 'xolox/vim-shell'

" I use Git a lot; so bring it into Vim.
Plug 'tpope/vim-fugitive' 
 \ | Plug 'tpope/vim-rhubarb'
 \ | Plug 'tommcdo/vim-fugitive-blame-ext'
 \ | Plug 'idanarye/vim-merginal'

" Development environment enhancements.
Plug 'direnv/direnv.vim'
 \ | Plug 'editorconfig/editorconfig-vim'
 \ | Plug 'embear/vim-localvimrc'

" I tend to work on Vim plugins myself. This makes it easier.
Plug 'tpope/vim-scriptease'

" Multi-purpose searching tool.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
 \ | Plug 'junegunn/fzf.vim'
 \ | Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

" A really nice colorscheme.
Plug 'ayu-theme/ayu-vim'

" Makes it easy to open and jump to line number in file.
Plug 'bogado/file-line'

" Prints out the doc signature.
Plug 'Shougo/echodoc.vim'

Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'

" Make it easy to work with tmux files and its provided events.
Plug 'tmux-plugins/vim-tmux'
 \ | Plug 'tmux-plugins/vim-tmux-focus-events'

" It's in the name; supports mad languages for Python, Ruby.
Plug 'sheerun/vim-polyglot'
 \ | Plug 'arnaud-lb/vim-php-namespace'
 \ | Plug 'davidhalter/jedi-vim'
 \ | Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
 \ | Plug 'lambdalisue/vim-pyenv'
 \ | Plug 'jmcantrell/vim-virtualenv'
 \ | Plug 'fisadev/vim-isort'
 \ | Plug 'python-rope/ropevim'
 \ | Plug 'tmhedberg/SimpylFold'

Plug 'vim-airline/vim-airline'
 \ | Plug 'vim-airline/vim-airline-themes'

" Things for tag support.
Plug 'craigemery/vim-autotag'
 \ | Plug 'majutsushi/tagbar'

" Make it easy to see that finicky whitespace.
Plug 'Yggdroot/indentLine'

" Move the buffer to the directory to work in.
Plug 'airblade/vim-rooter'

" Nifty plugin that helps with manipulation of surrounding characters.
Plug 'tpope/vim-surround'

" Language completion and manipulation support. This really turob charges
" the editor.
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
 \ | Plug 'roxma/nvim-completion-manager'
 \ | Plug 'roxma/nvim-cm-racer'
 \ | Plug 'roxma/ncm-github'
 \ | Plug 'Shougo/neco-vim'

" Advanced searchs replace.
Plug 'brooth/far.vim'

Plug 'roxma/vim-tmux-clipboard'

" Snippets because yes.
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

" Make netrw way more useful.
Plug 'tpope/vim-vinegar'

" Adjust shiftwidth & expandtab off history of file use.
Plug 'tpope/vim-sleuth'

" Map files to their semantically corresponding files for testing, etc.
Plug 'tpope/vim-projectionist'

" Start Vim with something useful.
Plug 'mhinz/vim-startify'

" Make Vim more appealing for focused editing.
Plug 'junegunn/goyo.vim'

" Focus on blocks of text.
Plug 'junegunn/limelight.vim'

call plug#end()

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
 autocmd!
 autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-php
 autocmd!
 function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
 endfunction
 autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
 autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

 function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
 endfunction
 autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
 autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
 autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
 autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
augroup END

augroup vimrc-python
 autocmd!
 autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
    \ formatoptions+=croq softtabstop=4
    \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

if executable('ag')
 let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
 set grepprg=ag\ --nogroup\ --nocolor
endif

" {{{ Searching
nnoremap <silent> <leader>sf :Files<cr>
nnoremap <silent> <leader>sgf :GFiles<cr>
nnoremap <silent> <leader>st :Tags<cr>
nnoremap <silent> <leader>sh :History<cr>
nnoremap <silent> <leader>sw :Windows<cr>
" }}}

" {{{ Extra special
func! s:LaunchNoteOfTheDay() abort
    execute ':Note Morning Entries/' . strftime('%Y-%m-%d')
    Goyo
endfunc

" Provides a helper command to write an entry for the day.
command! Today call <SID>LaunchNoteOfTheDay()
" }}}


" {{{ Git helpers
" TODO: Prune commands we don't use.
command! Greview :Git! diff --staged
nnoremap <silent> <leader>ga :Git add<space>
nnoremap <silent> <leader>gab :Git add %<cr>
nnoremap <silent> <leader>gb :Gbrowse<CR>
vnoremap <silent> <leader>gb :Gbrowse<CR>
nnoremap <silent> <leader>gc :Git commit<space>
nnoremap <silent> <leader>gC :Gcommit --branch --verbose %<CR>
nnoremap <silent> <leader>gco :Git checkout<space>
nnoremap <silent> <leader>gf :Git fetch<space>
nnoremap <silent> <leader>gfa :Git fetch --all<CR>
nnoremap <silent> <leader>gp :Git push<space>
nnoremap <silent> <leader>gP :Git push<CR>
nnoremap <silent> <leader>grm :Gremove %<CR>
nnoremap <silent> <leader>grmc :Git rm --cached %<CR>
nnoremap <silent> <leader>gr :Greview<cr>
nnoremap <silent> <leader>gl :FzfCommits<CR>
" }}}

" {{{ testing
nnoremap <silent> <leader>tt :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ta :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>
" }}}

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" {{{ Bind make command.
nnoremap <silent> <leader>m<space> :Make<space>
nnoremap <silent> <leader>ma :Make all<CR>
nnoremap <silent> <leader>mc :Make clean<CR>
nnoremap <silent> <leader>mi :Make install<CR>
nnoremap <silent> <leader>mt :Make test<CR>
nnoremap <silent> <leader>mtb :call('Make',['test',expand('%')])<CR>
nnoremap <silent> <leader>mu :Make uninstall<CR>
" }}}

" {{{ Travel over errors.
" TODO: Merge the closings opening of the windows into one.
" TODO: Make the mappings for navigation the same but intelligent.
nnoremap <silent> <leader>qe <ESC>:cnext<CR>
nnoremap <silent> <leader>qf <ESC>:cfirst<CR>
nnoremap <silent> <leader>ql <ESC>:clast<CR>
nnoremap <silent> <leader>qo <ESC>:cwindow<CR>
nnoremap <silent> <leader>qp <ESC>:cprevious<CR>
nnoremap <silent> <leader>qx <ESC>:cclose<CR>
nnoremap <silent> <leader>qX <ESC>:windo ccl<CR>

nnoremap <silent> <leader>le <ESC>:lnext<CR>
nnoremap <silent> <leader>lf <ESC>:lfirst<CR>
nnoremap <silent> <leader>ll <ESC>:llast<CR>
nnoremap <silent> <leader>lo <ESC>:lwindow<CR>
nnoremap <silent> <leader>lp <ESC>:lprevious<CR>
nnoremap <silent> <leader>lx <ESC>:lclose<CR>
nnoremap <silent> <leader>lX <ESC>:windo lcl<CR>
" }}}


" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>h :setlocal hlsearch!<cr>

" {{{ Timing options
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

" Inject the current time with the labeling of the time-zone.
inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>

" Inject the current date and time (in Insert or Command mode).
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>

" Inject the current date and time (in Insert or Command mode).
inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
" }}}

if has('macunix')
 " pbcopy for OSX copy/paste
 vmap <C-x> :!pbcopy<CR>
 vmap <C-c> :w !pbcopy<CR><CR>
endif

let g:jedi#popup_on_dot = 1
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>jn"
let g:jedi#rename_command = "<leader>jr"
let g:jedi#show_call_signatures = "1"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local.vim"))
 source ~/.config/nvim/local.vim
endif

if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif

let g:LanguageClient_autoStart = 1
let g:LanguageClient_selectionUI = 'fzf'

let g:pyenv#auto_create_ctags = 0
let g:pyenv#auto_activate = 1
let g:pyenv#auto_assign_ctags = 0

let g:test#preserve_screen = 0
let g:test#strategy = {
 \ 'nearest': 'neovim',
 \ 'file': 'dispatch',
 \ 'suite': 'neovim',
 \ }

let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '«'
let g:airline#extensions#branch#prefix = '⤴'
let g:airline#extensions#readonly#symbol = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol = 'ρ'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
let g:airline#extensions#neomake#enabled = 1
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert = 1
let g:airline_mode_map = {
 \ '__' : '-',
 \ 'n' : 'N',
 \ 'i' : 'I',
 \ 'R' : 'R',
 \ 'v' : 'V',
 \ 'V' : 'B'
 \ }

let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

let g:fzf_buffers_jump = 1
let g:fzf_history_dir = '~/.config/nvim/fzf-history'
let g:fzf_gitignore_map = "<Leader>sgi"
let g:fzf_tags_command = 'ctags -A .tags' 

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

let g:neomake_list_height = 5
let g:neomake_open_list = 2
let g:neomake_serialize = 0
let g:neomake_serialize_abort_on_error = 0
let g:neomake_verbose = 1
let g:neomake_remove_invalid_entries = 1
let g:neomake_logfile = expand('$HOME/.config/nvim/logs/neomake.log')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy', 'pylint']
let g:neomake_scss_enabled_makers = ['scss-lint']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
let g:neomake_vim_enabled_makers = ['vint']
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_comact = 1

let g:localvimrc_persistent = 2

let g:autotagVerbosityLevel = 3
let g:autotagTagsFile = '.vimtags'

autocmd VimEnter <silent> LocalVimRC

let g:airline_theme='badcat'
let ayucolor="dark"
colorscheme ayu

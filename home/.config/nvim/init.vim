" A bit easier on my hands.
let mapleader=','

" We'll start with plugin support.
filetype plugin indent on
syntax on
set ruler
set number
set termguicolors

" {{{ White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\ 

" Keep some spacing.
set sidescrolloff=1
"}}}

set conceallevel=2 concealcursor=nvci

if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

if exists('$NVIM_VERBOSE')
    set verbose=10 verbosefile=~/.config/nvim/logs/runtime.log
endif

" Paint the screen after we complete macro execution.
set lazyredraw

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
set ttyfast
set laststatus=2
set incsearch

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100
set smarttab
set shiftround
set expandtab

set foldenable
set foldcolumn=1

set ignorecase
set smartcase

set nocscopetag
set tags=tags,./tags;/

" Set up plugins.
call plug#begin('~/.config/nvim/plugins')

" Tim knows what's he's doing here.
Plug 'tpope/vim-sensible'

" Repeat anything (and everything).
Plug 'tpope/vim-repeat'

" Testing and linting support.
Plug 'benekastah/neomake'
Plug 'janko-m/vim-test'

Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-obsession'
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

" A really nice colorscheme.
Plug 'ayu-theme/ayu-vim'

Plug 'bogado/file-line'
Plug 'Shougo/echodoc.vim'

Plug 'tmux-plugins/vim-tmux'
            \ | Plug 'tmux-plugins/vim-tmux-focus-events'

" It's in the name; supports mad languages.
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

Plug 'craigemery/vim-autotag'

" Make it easy to see that finicky whitespace.
Plug 'Yggdroot/indentLine'

" Move the buffer to the directory to work in.
Plug 'airblade/vim-rooter'

" Give us a magic buffer with tag info!
Plug 'majutsushi/tagbar'

" Nifty plugin that helps with manipulation of surrounding characters.
Plug 'tpope/vim-surround'

" Language completion and manipulation support.
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
            \ | Plug 'roxma/nvim-completion-manager'
            \ | Plug 'roxma/nvim-cm-racer'
            \ | Plug 'roxma/ncm-github'
            \ | Plug 'Shougo/neco-vim'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'

call plug#end()

command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \                 <bang>0)


"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
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

" {{{ Git helpers
" TODO: Prune commands we don't use.
command! Greview :Git! diff --staged
nnoremap [git] <nop>
nnoremap <leader>g [git]
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
nnoremap <silent> [git]r   :Greview<cr>
nnoremap <silent> [git]l   :FzfCommits<CR>
" }}}

" {{{ testing
nnoremap [vimtest] <nop>
nnoremap <leader>v [vimtest]
nnoremap <silent> [vimtest]t :TestNearest<CR>
nnoremap <silent> [vimtest]f :TestFile<CR>
nnoremap <silent> [vimtest]a :TestSuite<CR>
nnoremap <silent> [vimtest]l :TestLast<CR>
nnoremap <silent> [vimtest]g :TestVisit<CR>
" }}}

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" {{{ Bind make command.
nnoremap [make] <nop>
nnoremap <leader>m [make]
nnoremap <silent> [make]<space>  :Make<space>
nnoremap <silent> [make]a        :Make all<CR>
nnoremap <silent> [make]c        :Make clean<CR>
nnoremap <silent> [make]i        :Make install<CR>
nnoremap <silent> [make]t        :Make test<CR>
nnoremap <silent> [make]tb       :call('Make',['test',expand('%')])<CR>
nnoremap <silent> [make]u        :Make uninstall<CR>
" }}}

" {{{ Travel over errors.
" TODO: Merge the closing + opening of the windows into one.
" TODO: Make the mappings for navigation the same but intelligent.
nnoremap [quickfix] <nop>
nnoremap <leader>q [quickfix]
nnoremap <silent> [quickfix]e <ESC>:cnext<CR>
nnoremap <silent> [quickfix]f <ESC>:cfirst<CR>
nnoremap <silent> [quickfix]l <ESC>:clast<CR>
nnoremap <silent> [quickfix]o <ESC>:cwindow<CR>
nnoremap <silent> [quickfix]p <ESC>:cprevious<CR>
nnoremap <silent> [quickfix]x <ESC>:cclose<CR>
nnoremap <silent> [quickfix]X <ESC>:windo ccl<CR>

nnoremap [loclist] <nop>
nnoremap <leader>l [loclist]
nnoremap <silent> [loclist]e <ESC>:lnext<CR>
nnoremap <silent> [loclist]f <ESC>:lfirst<CR>
nnoremap <silent> [loclist]l <ESC>:llast<CR>
nnoremap <silent> [loclist]o <ESC>:lwindow<CR>
nnoremap <silent> [loclist]p <ESC>:lprevious<CR>
nnoremap <silent> [loclist]x <ESC>:lclose<CR>
nnoremap <silent> [loclist]X <ESC>:windo lcl<CR>
" }}}


" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>h :setlocal hlsearch!<cr>

" Toggle the state of spelling locally.
nnoremap <silent> <leader>sp :setlocal spell!<cr>

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

let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
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
    \ 'file':    'dispatch',
    \ 'suite':   'neovim',
    \ }

let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep          = '▶'
let g:airline_left_alt_sep      = '»'
let g:airline_right_sep         = '◀'
let g:airline_right_alt_sep     = '«'
let g:airline#extensions#branch#prefix     = '⤴'
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
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
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'v'  : 'V',
    \ 'V'  : 'B'
    \ }

let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

let g:fzf_buffers_jump = 1
let g:fzf_history_dir = '~/.config/nvim/fzf-history'

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

let g:airline_theme='tomorrow'
let ayucolor="mirage"
colorscheme ayu

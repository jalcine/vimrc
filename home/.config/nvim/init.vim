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

" For example, a motion-orientated commenting tool and an extension that makes it easy to box up
" those comments.
Plug 'tpope/vim-commentary' 
            \ | Plug 'cbaumhardt/vim-commentary-boxed'

" I use Git a lot; so bring it into Vim.

" Snippet engine and repository of snippets.
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb'

" I tend to work on Vim plugins myself. This makes it easier.
Plug 'tpope/vim-scriptease'

" Multi-purpose searching tool.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
            \ | Plug 'junegunn/fzf.vim'

" A really nice colorscheme.
Plug 'ayu-theme/ayu-vim'

" It's in the name; supports mad languages.
Plug 'sheerun/vim-polyglot'
            \ | Plug 'arnaud-lb/vim-php-namespace'
            \ | Plug 'davidhalter/jedi-vim'
            \ | Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

Plug 'vim-airline/vim-airline'
            \ | Plug 'vim-airline/vim-airline-themes'

Plug 'craigemery/vim-autotag'

call plug#end()

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

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

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

let g:airline_theme='tomorrow'
let ayucolor="mirage"
colorscheme ayu


if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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

let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 
"" Vim configuration options.
""
"" @author Jacky Alcine <me@jalcine.me>
"" @date   2013-03-03 18:24:30 UTC-05:00
"" @vcs    git://github.com/jalcine/vimrc
""
"" I take pride in my Vim configuration. Being that I'm
"" an intermediate Vim user and I try to share as much
"" as I learn, I've taken the liberty of documenting and
"" explaining the nature of my configuration.
""
"" In order to ease  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" We live in the future, don't worry about backwards
" compatibility with Vi.
set nocompatible

" I have a suite of color schemes, but by default I stick
" to zenburn, it's light on the eyes and work on most of
" the brightness settings I use.
colorscheme zenburn 

" We turn off file-type detection for now, this is
" required for using Vundle.
filetype off

" Enable syntax detection and highlighting.
syntax on

" Set my user-defined action to the comma key.
let mapleader=","

"{{{ Configuration

" We live in the future. Use UTF-8 encoding!
set encoding=utf-8   

" Use visual bells instead of beeps. I use this
" since it helps a lot with tmux to inform me
" to switch over to it.
set visualbell

" Disable bells for errors.
set noerrorbells


"{{{ Spacing

" I prefer to use two spaces to represent tabs.
set tabstop=2

" In order to maintain capability, set shiftwidth 
" to the same value as tabstop.
set shiftwidth=2

" Set expandtab to the values used for tabstop
" and shiftwidth to ensure that we enter only 
" spaces, as well as enabling auto-indenting.
set expandtab ts=2 sw=2 ai

" Ensure that indentation for newly inserted text
" copies the style of that used already.
set autoindent

" Same as tabstop, setting this to 2 ensures that
" the tab stop is the same while I'm editing.
set softtabstop=2

" Ensures that <Tab>s are converted into spaces.
" We don't want any mix-ups here.
set smarttab

"}}}

"{{{ Layout

" Presents a '$' at the end of the line.
set list

"" Folding options

" Sets the width of the folding margins.
set foldcolumn=4

" Sets the minimum amount of lines needed to
" automatically initialize folding.
set foldminlines=80

"" Layout

" Set the title in the terminal.
set title titlelen=120 titlestring="%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)"

" Turn on the ruler, we'd like to know our whereabouts.
set ruler

" Enable relative number counting. No need to get exact numbers,
" you use 'hjkl', right?
set relativenumber

" Ensure the visibility of the statusline.
" Required for vim-powerline.
set laststatus=2

" Trust me, Vim, we're running in a 256-colored terminal.
set t_Co=256

"}}}

"{{{ Searching

" Highlight matches found when searching.
set hlsearch

" Enable incremental searching. 
set incsearch

" Show matching and (briefly) jump to the other partner just shortly.
" Very useful when doing JavaScript or C++.
set showmatch

" We're being greedy by default.
set gdefault                         
"}}}

"{{{ Recovery

" Record whether changes were made to unsaved buffers. 
set hidden

" Automatically save my changes.
set autowriteall

" Avoid using backup files. If you commit often into
" version control, backup files shouldn't be a problem.
set nobackup

" Avoid using swap files. It's bad for memory and doesn't
" work will with HUGE files.
set noswapfile

" Set the Vim command history size to a larger number.
set history=125

" Set the undo level to a little bit higher than default.
set history=1500
"}}}

"{{{ Formatting + Wrapping

" Bind a key for pasting from the clipboard.
set pastetoggle=<F2>

" Wrap up my text, don't have the luxury (or the want) of a
" scrollbar.
set wrap

" Add a margin to the wrapped text to prevent having to STARE
" at a dead wall (I had to do this since I'm in public places a lot)
set wrapmargin=5

" A sequence of characters that define the automatic formatting
" style. I used the following:
"
"   - t: auto wrap the text according to 'textwidth'
"   - c: auto wrap comments using according to 'textwidth'
"   - r: automatically add a comment mark when hitting <Enter> 
"        in Insert mode.
"   - q: permit the formatting of comments with 'gq'.
"   - w: trailing space? [paragraph] no space? [no paragraph].
"   - n: recognize numbered lists when formatting.
"   - 2: keep the formatting of the second line.
"   - l: don't break long lines.
"   - m: break on multi-byte characters.
"   - M: don't put a space between 2 multi-byte characters.
"   - 1: don't break a line after a one-letter word. Yeah, I know.
"   - j: join comments lines when it makes sense.
set formatoptions=tcrqwnj2lm1j

" Files that we ignore.
set wildignore=*.swp,*.pyc,*.bak,*.class

" DON'T SCROLL OFF. It's a space and time.
set scrolloff=0
set sidescrolloff=0

" We a UNIX user, baby.
set fileformats=unix

"}}}

"{{{ Miscellaneous

" Define the registers used for copying + pasting + yanking.
" I use the following registers:
"
"   - unnamed:      save everything to '*'
"   - unnamedplus:  save everything to '+'
set clipboard=unnamedplus

" Enable the mouse in every mode.
set mouse=a

"}}}

"{{{ Key bindings.
nnoremap ; :  "" One less key to press.
nmap <silent> <leader>ev :e ~/.vimrc<cr> 
nmap <silent> <leader>sv :so ~/.vimrc<cr>
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
nnoremap <silent> <F10> :NERDTreeToggle<CR>
nnoremap <silent> <leader>z :CommandT<CR> 
nnoremap <silent> <leader>a :CommandTBuffer<CR> 
nnoremap <silent> <leader>j :setlocal nospell<CR>
nnoremap <silent> <leader>J :setlocal spell<CR>
noremap <silent> <F7> :Autoformat<CR><CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <leader>g :GundoToggle<CR>
noremap <leader>i :set list!<cr>
"}}}

"{{{ Plug-ins

" I use Vundle as my plug-in management system.

"" Set up Vundle.
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'benmills/vimux'

"{{{ VCS Tools
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
"}}}

"{{{ Ruby
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'mileszs/apidock.vim'
Bundle 'ecomba/vim-ruby-refactoring'
"}}}

"{{{ Syntax
Bundle 'tpope/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jQuery'
Bundle 'fs111/pydoc.vim'
Bundle 'lepture/vim-css'
Bundle 'alfredodeza/jacinto.vim'
"}}}

"{{{ Debugging
Bundle 'sjl/gundo.vim'
Bundle 'jpalardy/vim-slime'
"}}}

"{{{ IDE Tools
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'wincent/Command-T'
Bundle 'Chiel92/vim-autoformat'
Bundle 'alfredodeza/pytest.vim'
Bundle 'TaskList.vim'
Bundle 'Tagbar'
Bundle 'Align'
Bundle 'thinca/vim-localrc'

"{{{ Snippets
Bundle 'msanders/snipmate.vim'
Bundle 'pferdefleisch/sass.snippet'

" Using gists?
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'gmarik/github-search.vim'
"}}}

"}}}

"{{{ Security + Encryption
Bundle 'jamessan/vim-gnupg'
"}}}

" Activate plugin detection now.
filetype plugin indent on
"}}}

" Enable file-type detection.
filetype on

"{{{ Plugin Configuration

"{{{ Syntastic options
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=1
let g:syntastic_enable_highlighting=1
"}}}

"{{{ Command-T
let g:CommandTMaxHeight=6
let g:CommandTMatchWindowAtTop=1
"}}}

let g:github_search_path_format="~/Development/Projects/:project"
let g:ycm_key_detailed_diagnostics = ""
"}}}

"{{{ virtualenv python support
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
"}}}

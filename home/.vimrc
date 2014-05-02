" File: .vimrc
" Author: Jacky Alciné <me@jalcine.me>
" Description: The heart.

"{{{ Immediate Options
" We live in the future, don't worry about backwards compatibility with Vi.
" In fact, why bother set it? If $VIM is reading this, nocp is active!
set nocompatible

" Don't talk too much on start.
set shortmess+=I

" We use UNIX. So act like UNIX.
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix

" Use Bash. At all costs.
" Also, update my path.
set shell=/bin/bash
set path=.,$HOME/.local/include,/usr/local/include,/usr/include

" We need modelines.
set modeline
set shellslash

if v:version >= 703 | set cryptmethod=blowfish | endif

" Save your work in sessions.
set sessionoptions=buffers,tabpages,winsize,curdir
"}}}
"{{{ Visual Controls
set novisualbell
set noerrorbells
set ruler
if has('conceal') | set conceallevel=1 | endif
set number numberwidth=2

" Gimme something to look at.
set laststatus=2
set showtabline=2

" Use the clicking thing, Luke (no).
"set mouse=a
"set ttymouse=xterm2

" PASTE mo'fo!
set pastetoggle=<F2>

" Set the title in the terminal.
set title titlelen=120
set titlestring="%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)"

" Update by redraw and not INS/DEL
set ttyscroll=10 ttyfast

" Show me what I was doing.
set showcmd
set noshowfulltag
set showmatch

" Show me the overflow.
if has('syntax') && v:version >= 704
  call matchadd('ColorColumn', '\%' . &textwidth . 'v', 100)
  set nocursorline nocursorcolumn
endif

"}}}
"{{{ Spacing
" Do this when I hit <Backspace>.
set backspace=indent,eol,start

" I prefer to use two spaces to represent tabs.
set tabstop=2 softtabstop=2 shiftwidth=2
set smarttab expandtab

" Set a hard wrapping to 78 characters. Nothing should be longer than that.
" Trust me, living a few days in the console will teach you that.
set textwidth=79
set wrap wrapmargin=1

" Using 'smartindent' is obselete; let ftindent plugins do their magic and
" just format C-like files.
set cindent

" }}}
" {{{ Wild Side & Completion
" Enable your wild side, take command completion completion up a notch.
" Allow for an interesting view when opening the command line menu.
set wildmode=list:longest
set wildmenu
set wildoptions=tagfile
if has('wildignore') && v:version >= 704 | set wildignorecase | endif
set completeopt=longest,menuone

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
" }}}
" {{{  Tags
" Clean it out.
set tags=./tags,./TAGS
if isdirectory('~/.tags')
  let tagfiles = expand('~/.tags/**/*.tags', 0, 1)
  for atagfile in tagfiles
    let &tags .= ',' . fnamemodify(atagfile,':p:.')
  endfor
endif

" }}}
" {{{ Folding
" Allow for Vim syntax folding.
let g:vimsyn_folding='afpPr'
let g:vimsyn_embed='Pr'

" We fold all ze time, according to syntax.
set foldenable foldmethod=syntax

" Tiny fold column, all the time folding.
set foldcolumn=1 foldlevel=1

" Show anything less than 3 lines.
set foldminlines=2
set foldnestmax=5
"}}}
"{{{ Searching
" Highlight matches found when searching.
set hlsearch incsearch

" Show matching and (briefly) jump to the other partner just shortly.
" Very useful when writing code in JavaScript or C++.
set showmatch wrapscan
set nogdefault noignorecase
"}}}
"{{{ Recovery
" Record whether changes were made to unsaved buffers.
set hidden

" Avoid using backup files. If you commit often into
" version control, backup files shouldn't be a problem.
set nobackup noswapfile

" Set the Vim command history size to a larger number.
set history=16384 undolevels=16384
"}}}
"{{{ Spelling Options
" I'll check when I want.
set nospell

" English speaking, American born. So let's correct ourselves like one. Since
" I'm learning French and know a bit of Spanish; we'll add those dictionaries
" in as well.
set spelllang=en_us

" Help me figure how what to spell.
set spellsuggest=best,3

" Add a bunch of dictionaries.
set dictionary+=/usr/share/dict/words,/usr/share/dict/american-english
set dictionary+=/usr/share/dict/web2,/usr/share/dict/propernames.gz
set dictionary+=/usr/share/dict/connectives.gz,/usr/share/dict/web2a.gz

" Set a location to save my added words.
set spellfile=~/.vim/dict.custom.utf8-8.add
"}}}
"{{{ Whitespacing and Fonts
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars=diff:⣿,vert:│

" A visual cue for line-wrapping.
set showbreak=↪

" Visual cues when in 'list' model.
set list listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:×
set sidescroll=5
"}}}
"
" {{{ Timeouts
set timeout ttimeout
set timeoutlen=400
set ttimeoutlen=500
set updatetime=1500
" }}}

" {{{ Vundle setup
"
" Update 'rtp' and 'ft' to handle plugin loading.
filetype off
source ~/.vim/plugin/options.vim
if filereadable('~/.vim/plugin/options.local.vim')
  source ~/.vim/plugins/options.local.vim
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" {{{ Plugin list
" {{{ Core plugins
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'thinca/vim-localrc'
Plugin 'Shougo/vimproc.vim'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'mhinz/vim-signify'
Plugin 'int3/vim-extradite'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/webapi-vim'
" }}}

" {{{ Utility plugins
Bundle 'junegunn/goyo.vim'
Plugin 'godlygeek/csapprox'
Plugin 'guns/xterm-color-table.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/Ultisnips'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-abolish'
Plugin 'jalcine/vim-snippets'
"Plugin 'jalcine/cmake.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 't4ku/marktag'
Plugin 'terryma/vim-multiple-cursors'
" }}}

" {{{ Unite plugins
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'zepto/unite-tmux'
Plugin 'yuku-t/unite-git'
Plugin 'pasela/unite-webcolorname'
" }}}

" {{{ Version Control
Plugin 'tpope/vim-git'
Plugin 'mattn/gist-vim'
Plugin 'junegunn/vim-github-dashboard'
Plugin 'mmozuras/vim-github-comment'
"Plugin 'jaxbot/github-issues.vim'
" }}}

" {{{ Language support
Plugin 'ap/vim-css-color'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
Plugin 'moll/vim-node'
Plugin 'ahayman/vim-nodejs-complete'
Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mklabs/vim-backbone'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jalcine/cmake.vim'
Plugin 'Valloric/YouCompleteMe'
" }}}

syntax enable
filetype plugin indent on
" }}}

" {{{ Color scheming
" Define the colorscheme that'd be used. Can't lie; it's hard to pick *only*
" one. Also apply the color scheme for airline.
colorscheme lucius
" }}}

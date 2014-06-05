" vim: ft=vim fdm=marker tw=78 fdl=0
" File: .vimrc
" Author: Jacky Alciné <me@jalcine.me>
" Description: The heart.

" This is my Vim setup. It's meant to be overriden since it ends up being
" useful in dozens of people be it on a mobile device or in the cloud.
" Not like a real cloud, like a server on the Internet that I couldn't
" directly access.

"{{{ Immediate Options
" We live in the future, don't worry about backwards compatibility with Vi.
" In fact, why bother set it? If $VIM is reading this, nocp is active!
set nocompatible

" Don't talk too much on start.
set shortmess+=I

" We use UNIX. So act like UNIX.
set encoding=utf-8 ambiwidth=single
set fileencoding=utf-8
set fileformats=unix

" Use Bash. At all costs.
" Also, update my path.
set shell=/bin/bash
set path=.,$HOME/.local/include,/usr/local/include,/usr/include

" We need modelines.
set modeline
set shellslash

" If we're running a cool version of Vim, then be cool.
if v:version >= 703 | set cryptmethod=blowfish | endif

" Save your work in sessions.
set sessionoptions=buffers,tabpages,winsize,curdir
"}}}
"{{{ Visual Controls
set novisualbell
set noerrorbells
set ruler
if has('conceal') | set conceallevel=1 | endif

" Gimme something to look at.
set laststatus=2
set showtabline=2

" Use the clicking thing, Luke (no).
set mouse=a
set ttymouse=xterm2

" PASTE mo'fo!
set pastetoggle=<F2>

" Set the title in the terminal.
set title titlelen=120
set titlestring="%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)"

" Update by redraw and not INS/DEL
set ttyscroll=10 ttyfast

" Show me what I was doing.
if has('showcmd') | set showcmd | endif
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
set nowrap

" Using 'smartindent' is obselete; let ftindent plugins do their magic and
" just format C-like files.
set cindent

" }}}
" {{{ Wild Side & Completion
" Enable your wild side, take command completion completion up a notch.
" Allow for an interesting view when opening the command line menu.
set wildmenu wildmode=longest:full
set wildoptions=tagfile
if has('wildignore') && v:version >= 704 | set wildignorecase | endif

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
set foldcolumn=2 foldlevel=0

" Show anything less than 3 lines.
set foldminlines=2 foldnestmax=5 foldlevelstart=1
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

" Avoid using backup or swap files. If you commit often into
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
set fillchars+=diff:⣿
set fillchars+=vert:│
if has('folding') | set fillchars+=fold:— | endif
"if has('folding') | set fillchars+=fold:- | endif

" A visual cue for line-wrapping.
if has('linebreak') | set showbreak=↪ | endif

" Visual cues when in 'list' model.
set list
set listchars+=eol:¬
set listchars+=extends:❯,precedes:❮
set listchars+=tab:\|\ 

set sidescroll=5
"}}}
" {{{ Timeouts
set timeout ttimeout
set timeoutlen=400 ttimeoutlen=500
set updatetime=1500
" }}}
" {{{ Local Configuration
if filereadable('~/.vimrc.local') | source ~/.vimrc.local | endif
" }}}
" {{{ Vundle Setup
"
" Update 'rtp' and 'ft' to handle plugin loading.
filetype off

" Read in my options.
source ~/.vim/plugin/options.vim

if filereadable('~/.vim/plugin/options.local.vim')
  source ~/.vim/plugins/options.local.vim
endif

" Megaman, POWER UP!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" {{{2 Plugin list
" {{{3 Core plugins
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
Plugin 'reedes/vim-colors-pencil'
Plugin 'zaiste/tmux.vim'
Plugin 'puppetlabs/puppet-syntax-vim'
" }}}
" {{{3 Utility plugins
Bundle 'junegunn/goyo.vim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/Ultisnips'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-abolish'
Plugin 'honza/vim-snippets'
Plugin 'jalcine/cmake.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
if v:version >= 703 | Plugin 'Valloric/YouCompleteMe' | endif
Bundle 'dbakker/vim-lint'
Bundle 'elzr/vim-json'
Bundle 'mattboehm/vim-accordion'
Bundle 'jalcine/vim-swigjs'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'marijnh/tern_for_vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'moll/vim-node'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'junegunn/vim-github-dashboard'
" }}}
" {{{3 Unite plugins
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'zepto/unite-tmux'
Plugin 'yuku-t/unite-git'
Plugin 'pasela/unite-webcolorname'
" }}}
"}}}
"
syntax enable
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" }}}
" {{{ Color scheming
" 256 colors all dai.
set t_Co=256
" Define the colorscheme that'd be used. Can't lie; it's hard to pick *only*
" one. Also apply the color scheme for airline.
colorscheme pencil
set background=dark
hi Normal     ctermbg=NONE guibg=NONE
hi FoldColumn ctermbg=NONE guibg=NONE
hi VertSplit  ctermbg=NONE guibg=NONE
" }}}

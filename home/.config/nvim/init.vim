" File: config/init.vim
" Author: Jacky Alcine <yo@jacky.wtf>
" Description: Entry point of all of my configuration.
" Last Modified: August 08, 2017
" vim: set fdm=marker foldlevel=0 :

set encoding=utf-8
scriptencoding utf-8

if v:version < 800
  echoerr "[jalcine] Please upgrade Vim to Vim8 or use Neovim (recommended)."
endif

" Visual Editor Components {{{
set laststatus=2
set ruler
set number relativenumber
set termguicolors guicursor=
set nocursorline nocursorcolumn
set sidescrolloff=1 sidescroll=1
set conceallevel=2 concealcursor=nvic
set nowrap
set signcolumn=yes
set shortmess+=c
set hidden
set pumheight=5
set noshowmode noshowmatch
"
" Folding {{{
set foldenable
set foldcolumn=2
set foldlevel=2
set foldmethod=syntax
" }}}
" }}}
"
" White spacing and Characters {{{
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

"}}}
"
" Debugging help {{{
" This makes it easier for me to capture logging output from Vim.
if exists('$DEBUG')
    set verbose=3
    let &verbosefile=expand('$HOME/.config/nvim/logs/runtime.log')
    let $NVIM_PYTHON_LOG_FILE=expand("$HOME/.config/nvim/logs/python.log")
endif
" }}}
"
" Undo, Backup, Swap {{{
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=1000

set backup writebackup

set noswapfile
" }}}
"
" Spacing {{{
set tabstop=2 softtabstop=2
set shiftwidth=2 textwidth=80
set smarttab expandtab
set shiftround
" }}}
"
" Searching {{{
set ignorecase smartcase
set laststatus=2 cmdheight=2
set incsearch hlsearch
" }}}
"
" Tags {{{
" Find tags in local directory.
set tags+=./tags,./.tags,./.vimtags
set tags+=tags,.tags,.vimtags

" Import globally built tags.
set tags+=$HOME/.config/nvim/tags/*

" Disable cscope.
set nocscopetag
" }}}
"
" {{{ Extra special
set modeline modelines=10

" TODO: Move to commands file.
func! s:LaunchNoteOfTheDay() abort
    execute ':Note Morning Entries/' . strftime('%Y-%m-%d')
    Goyo 90x20
endfunc

" Provides a helper command to write an entry for the day.
command! Today call <SID>LaunchNoteOfTheDay()
" }}}

" Lift off.
call jalcine#launch()

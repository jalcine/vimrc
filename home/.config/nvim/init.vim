" File: config/init.vim
" Author: Jacky Alcine <yo@jacky.wtf>
" Description: Entry point of all of my configuration.
" Last Modified: August 08, 2017
" vim: set fdm=marker foldlevel=1 :

if v:version < 800
    echoerr "[jalcine] Please upgrade Vim to Vim8 or use Neovim (recommended)."
endif

set encoding=utf-8

" Visual Editor Components {{{
set laststatus=2
set ruler
set number relativenumber
set termguicolors guicursor=
set cursorline
set wrap
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

" Keep some spacing and make each buffer its own thing.
set sidescrolloff=1
set nowrap

" Hide some things from me. I don't need to know everything.
set conceallevel=2 concealcursor=nvci
"}}}
"
" Debugging help {{{
" This makes it easier for me to capture logging output from Vim.
if exists('$NVIM_VERBOSE')
    set verbose=10
    set verbosefile=~/.config/nvim/logs/runtime.log
    set debug=msg,throw,beep
endif
" }}}
"
" Undo, Backup, Swap {{{
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=1000

set backup writebackup
" }}}
"
" Custom file-specific Vim option definitions {{{
set modeline
set modelines=10
" }}}
"
" Spacing {{{
set tabstop=2 softtabstop=2
set shiftwidth=2 textwidth=100
set smarttab expandtab
set shiftround
" }}}
"
" Folding {{{
set foldenable
set foldcolumn=1
set foldlevel=1
set foldmethod=syntax
" }}}
"
" Searching {{{
set ignorecase smartcase
set laststatus=2
set incsearch hlsearch
" }}}
"
" Tags {{{
" Find tags in local directory.
set tags+=./tags,./.tags,./.vimtags
set tags+=tags,.tags,.vimtags

" Import globally built tags.
set tags+=$HOME/.config/nvim/tags/*
" }}}
"
" {{{ Extra special
" TODO: Move to commands file.
func! s:LaunchNoteOfTheDay() abort
    execute ':Note Morning Entries/' . strftime('%Y-%m-%d')
    Goyo
endfunc

" Provides a helper command to write an entry for the day.
command! Today call <SID>LaunchNoteOfTheDay()
" }}}
" TODO: Move to vimrc for osxrc.
if has('macunix')
 " pbcopy for OSX copy/paste
 vmap <C-x> :!pbcopy<CR>
 vmap <C-c> :w !pbcopy<CR><CR>
endif

call jalcine#launch()

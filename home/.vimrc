" vim: set fdm=marker foldenable foldlevel=0 nospell:
" File:          .vimrc
" Author:        Jacky Alciné <me@jalcine.me>
" Description:   The heart.
" Last Modified: 2015-01-03 15:51:04 EST
"
" This is my Vim setup. It's meant to be overridden since it ends up being
" useful in dozens of people be it on a mobile device or in the cloud.
" Not like a real cloud, like a server on the Internet that I couldn't
" directly access.

" This 's:os_name' is meant to only be used here since I only try to get
" OS-specific things ironed out here.
let s:os_name="Unknown"
if executable('uname')
  let s:os_name=substitute(system('uname'),'\n','','g')
else
  " Has to be Windows or something not *nix-ish.
  " Why would you run Vim on Windows?
  let s:os_name="Windoze"
endif

"{{{ Immediate Options
" We live in the future, don't worry about backwards compatibility with Vi.
" In fact, why bother set it? If $VIM is reading this, nocp is active!
set nocompatible

" We use UNIX. So act like UNIX.
set encoding=utf-8
set ambiwidth=single
set fileencoding=utf-8
set fileformats=unix

" Use Bash. At all costs.
" Also, update my path.
set shell=/bin/bash
set path=.,/usr/local/include,/usr/include,$HOME/.local/include

" We need modelines.
set modeline
set shellslash

" Save your work in sessions.
set sessionoptions=buffers,tabpages,winsize,curdir

" Change up the short messages in Vim.
set shortmess+=TI
set shortname

" Save our undo changes.
set undodir=expand('$HOME/.vim/undo')
"}}}
"{{{ Visual Controls
set visualbell
set errorbells
set ruler
set nonumber
if has('conceal') | set conceallevel=2 concealcursor=ncv | endif

" Gimme something to look at.
set laststatus=2
set showtabline=2

" Use the clicking thing, Luke (no).
set mouse=a
set ttymouse=xterm2

" PASTE mo'fo!
set pastetoggle=<F2>

" Set the title in the terminal.
set title
set titlelen=60

" Update by redraw and not INS/DEL
set ttyscroll=5
set nottyfast

set showcmd
set showfulltag
set showmatch

" Show me the overflow.
if has('syntax') && v:version >= 704
  call matchadd('ColorColumn', '\%' . &textwidth . 'v', 80)
endif

"}}}
"{{{ Spacing
" Do this when I hit <Backspace>.
set backspace=indent,eol,start

" I prefer to use two spaces to represent tabs.
set tabstop=2 softtabstop=2 shiftwidth=2
set smarttab expandtab

" Set a hard wrapping to 78 characters. Nothing should be longer than that.
" Trust me, living a few days in the console will teach you that. Unless you
" don't use a multiplexer or use a terrible window manager like Quartz.
set textwidth=79
set nowrap

" Using 'smartindent' is obsolete; let ftindent plugins do their magic and
" just format C-like files.
set cindent

" }}}
"{{{ Wild Side & Completion
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
"{{{ Folding
" Allow for Vim syntax folding.
let g:vimsyn_folding='afpPr'
let g:vimsyn_embed='Pr'

" We fold when we need to, according to syntax.
set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldlevel=3
set foldminlines=5
set foldnestmax=5
set foldlevelstart=2
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

" No annoying-ass swap files.
set noswapfile

" Set the Vim command history size to a larger number.
set history=9999
set undolevels=9999
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
set dictionary+=/usr/share/dict/words,
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/web2,
set dictionary+=/usr/share/dict/propernames.gz
set dictionary+=/usr/share/dict/connectives.gz
set dictionary+=/usr/share/dict/web2a.gz

" Set a location to save my added words.
set spellfile=~/.vim/dict.custom.utf8-8.add
"}}}
"{{{ White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
if has('linebreak') | set showbreak=↪ | endif

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
"{{{ Timeouts
set timeout
set ttimeout
set timeoutlen=400
set ttimeoutlen=500
set updatetime=1500
"}}}

source ~/.vim/plugin/10_options.vim
if filereadable('~/.vim/options.local.vim') | source ~/.vim/options.local.vim | endif
source ~/.vim/plugin/00_plugins.vim
if filereadable('~/.vimrc.local') | source ~/.vimrc.local | endif

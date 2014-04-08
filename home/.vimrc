" vim: set foldenable foldlevel=1 fdm=marker tw=78
" File: .vimrc
" Author: Jacky Alciné <me@jalcine.me>
" Description: The heart.

"{{{ Immediate Options
" We live in the future, don't worry about backwards compatibility with Vi.
" In fact, why bother set it? If $VIM is reading this, nocp is active!
set nocompatible

" Don't talk too much.
set shortmess+=I

" We dark by default. This prevents a nasty flash when Vim starts because of
" the way I handle my (dozens) colorschemes.
set background=dark
colorscheme zellner

" We use UNIX. So act like UNIX.
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix

" Use Bash. At all costs.
set shell=/bin/bash
set path=.,$HOME/.local/include,/usr/local/include,/usr/include

" We need modelines.
set modeline
set shellslash
set cryptmethod=blowfish

" Set my user-defined action to the comma key.
let mapleader=','
let maplocalleader='\\'

" Save your work in sessions.
set sessionoptions=buffers,tabpages,winsize,curdir
"}}}
"{{{ Visual Controls
set novisualbell
set noerrorbells
set ruler number

" Gimme something to look at.
set laststatus=2
set showtabline=2

" Use the clicking thing, Luke.
set mouse=a
set ttymouse=xterm

" PASTE mo'fo!
set pastetoggle=<F2>

" Set the title in the terminal.
set title
set titlelen=120
set titlestring="%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)"

" Update by redraw and not INS/DEL
set ttyscroll=3
set ttyfast
set lazyredraw

" Show me what I was doing.
set showcmd
set showfulltag

" Show me the overflow.
call matchadd('ColorColumn', '\%' . &textwidth . 'v', 100)
"}}}
"{{{ Spacing
" Do this when I hit <Backspace>.
set backspace=indent,eol,start

" I prefer to use two spaces to represent tabs.
set tabstop=2
set softtabstop=2

" Set expandtab to the values used for tabstop
" and shiftwidth to ensure that we enter only 
" spaces, as well as enabling auto-indenting.
" Also ensures that <Tab>s are converted into spaces.
" We don't want any mix-ups here.
set smarttab
set expandtab

" Set a hard wrapping to 78 characters. Nothing should be longer than that.
" Trust me, living a few days in the console will teach you that.
set textwidth=78
set wrap
set shiftwidth=2

" Automatically indent text.
set autoindent
set cindent
" }}}
" {{{ Wild Side & Completion
" Enable your wild side, take command completion completion up a notch.  
" Allow for an interesting view when opening the command line menu.
set wildmode=full
set wildmenu
set wildignorecase
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
let tagfiles = expand('$HOME/.tags/**/*.tags', 0, 1)
for atagfile in tagfiles
  let &tags .= ',' . fnamemodify(atagfile,':p:.')
endfor
" }}}
"{{{ Folding 
" We fold all ze time.
set foldenable

" Fold on the syntax.
set foldmethod=syntax

" Sets the width of the folding margins.
set foldcolumn=2

" Fold all the time.
set foldlevel=1

" Show anything less than 3 lines.
set foldminlines=2
set foldnestmax=5
"}}}
"{{{ Searching
" Highlight matches found when searching.
set hlsearch

" Enable incremental searching. 
set incsearch

" Show matching and (briefly) jump to the other partner just shortly.
" Very useful when writing code in JavaScript or C++.
set showmatch
set nogdefault
set noignorecase
set regexpengine=1
"}}}
"{{{ Recovery
" Record whether changes were made to unsaved buffers. 
set hidden

" Automatically save my changes.
set autowriteall
set autoread

" Avoid using backup files. If you commit often into
" version control, backup files shouldn't be a problem.
set nobackup

" Avoid using swap files. It's bad for memory and doesn't
" work will with HUGE files.
set noswapfile

" Set the Vim command history size to a larger number.
set history=16384

" Set the undo level to a little bit higher than default.
set undolevels=16384
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
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:×
set nolist
"}}}
"
" {{{ Timeouts
set timeout ttimeout
set timeoutlen=400
set ttimeoutlen=500
set updatetime=2000
" }}}

call jalcine#roll_out()

"" vim: tw=78 fdm=marker
"" Vim configuration options.
""
"" @author Jacky Alciné <me@jalcine.me>
"" @date   2013-09-21 16:59:24 EDT
"" @vcs    https://github.com/jalcine/vimrc
""
"" I take pride in my Vim configuration. Being that I'm an intermediate Vim 
"" user and I try to share as much as I learn, I've taken the liberty of
"" documenting and explaining the nature of my configuration. I use the
"" latest development version of Vim from sources using a PPA in Ubuntu;
"" makes life a bit easier. I only commented with my reasoning for using the
"" options provided; if you needed help; you know how to find it.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{2 Immediate Options
" We live in the future, don't worry about backwards compatibility with Vi.
" In fact, why bother set it? If $VIM is reading this, nocp is active!
"set nocompatible

" We use UNIX. So act like UNIX.
set encoding=utf-8 fileencoding=utf-8 fileformats=unix

" Use my bash file.
let $BASH_ENV="$HOME/.bashrc"

" Enable the use of Bash into the mix.
set shell=/bin/bash shellcmdflag=-c

" We need modelines.
set modeline

" Set my user-defined action to the comma key.
let mapleader=","
let maplocalleader="\\"

" Use specific indentation files.
filetype indent plugin on
"}}}
"{{{2 Immediate Configuration Options

" Use visual bells instead of beeps. I use this
" since it helps a lot with tmux to inform me
" to switch over to it. Also enable bells for errors.
set visualbell errorbells

" Gimme something to look at.
set laststatus=2

" Show me the tab bar no matter what.
set showtabline=2
"}}}
"{{{2 Spacing

" I prefer to use two spaces to represent tabs.
"set tabstop=2 softtabstop=2

" Set expandtab to the values used for tabstop
" and shiftwidth to ensure that we enter only 
" spaces, as well as enabling auto-indenting.
" Also ensures that <Tab>s are converted into spaces.
" We don't want any mix-ups here.
set smarttab expandtab

" Set a hard wrapping to 78 characters. Nothing should be longer than that.
" Trust me, living a few days in the console will teach you that.
set textwidth=78 shiftwidth=2

" Automatically indent text.
set autoindent

" Enable your wild side, take command completion completion up a notch.
set wildmenu

" Allow for an interesting view when opening the command line menu.
set wildmode=longest:full wildignorecase

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build,tmp,vendor/cache,bin

" PASTE mo'fo!
set pastetoggle=<F2>

" Wrap text around; keep what we need in sight.
set wrap wrapmargin=1

" Use the clicking thing, Luke.
set mouse=a ttymouse=xterm

" I place my tags all over the place. Bring them
" to me!
set tags+=$HOME/.tags/*.tags

" Save your work in sessions.
set sessionoptions=buffers,tabpages,winsize,curdir

"{{{2 Layout

" We fold.
set foldenable

" Fold on the syntax.
set foldmethod=indent

" Sets the width of the folding margins.
set foldcolumn=2

" Sets the minimum amount of lines needed to
" automatically initialize folding.
set foldminlines=3

" Anything greater than this is automatically folded.
set foldlevel=1

" Set the title in the terminal.
set title titlelen=120 titlestring="%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)"

" Turn on the ruler, we'd like to know our whereabouts.
set ruler

" We like a stable number count.
set number numberwidth=2

"{{{2 Searching

" Highlight matches found when searching.
set hlsearch

" Enable incremental searching. 
set incsearch

" Show matching and (briefly) jump to the other partner just shortly.
" Very useful when doing JavaScript or C++.
set showmatch

" We aren't that greedy.
set nogdefault

"{{{2 Recovery

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
set history=16384

" Set the undo level to a little bit higher than default.
set undolevels=16384

"{{{2 Spelling Options
" I'll check when I want.
set nospell

" English speaking, American born. So let's correct ourselves like one. Since
" I'm learning French and know a bit of Spanish; we'll add those dictionaries
" in as well.
set spelllang=en_us

" Help me figure how what to spell.
set spellsuggest=best,5

" Add a bunch of dictionaries.
set dictionary+=/usr/share/dict/words,/usr/share/dict/american-english
set dictionary+=/usr/share/dict/web2,/usr/share/dict/propernames.gz

" Set a location to save my added words.
set spellfile=~/.vim/dict.custom.utf8-8.add

"{{{2 Visual Cues
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars=diff:⣿,vert:│
set guifont=monoOne\ 9
" A visual cue for line-wrapping.
set showbreak=↪

" Visual cues when in 'list' model.
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:×

" Show me these markings.
set list

" Update by redraw and not INS/DEL
set ttyscroll=3 ttyfast

" Show me what I was doing.
set showcmd showfulltag

" Let me know where I am.
set cursorline cursorcolumn

" Do this when I hit <Backspace>.
set backspace=indent,eol,start

" Don't talk too much.
set shortmess+=I
"" }}}

" This is required in order to ensure proper plugin loading.
source $HOME/.vim/plugin/custom/000-installing-vundle.vim
source $HOME/.vim/plugin/custom/000-settings.vim
source $HOME/.vim/plugin/custom/001-extensions.vim

" Because we need dat syntax.
syntax on

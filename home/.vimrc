"" vim: tw=78 fdm=marker
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
"" I use the latest development version of Vim from sources.
"" The ./configure I use is the following:
"" ./configure --with-local-dir=/home/jacky/.local --prefix=/home/jacky/.local --with-python-config-dir=/usr/lib/python2.7/config --with-python3-config-dir=/usr/lib/python3/config --with-features=big --with-compiledby="Jacky Alcine <me@jalcine.me>" --disable-gtktest  --enable-cscope --disable-darwin --enable-perlinterp --enable-pythoninterp --enable-rubyinterp --enable-tclinterp --enable-luainterp --enable-fontset --enable-multibyte --enable-xim --with-mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" We live in the future, don't worry about backwards
" compatibility with Vi.
set nocompatible

" Enable the use of Bash into the mix.
let $BASH_ENV="$HOME/.bashrc"
set shell=/bin/bash

" Import plugins.
source ~/.vim/plugins.vim

" We need modelines.
set modeline

" Set my user-defined action to the comma key.
let mapleader=","
let maplocalleader="\\"

"{{{1 Immediate Configuration Options

" We live in the future. Use UTF-8 encoding!
set encoding=utf-8

" Use visual bells instead of beeps. I use this
" since it helps a lot with tmux to inform me
" to switch over to it.
set visualbell

" Enable bells for errors.
set errorbells

"{{{2 Spacing

" I prefer to use two spaces to represent tabs.
set tabstop=2

" In order to maintain capability, set shiftwidth 
" to the same value as tabstop.
set shiftwidth=2

" Set expandtab to the values used for tabstop
" and shiftwidth to ensure that we enter only 
" spaces, as well as enabling auto-indenting.
set expandtab ai

" Ensure that indentation for newly inserted text
" copies the style of that used already.
set autoindent

" Same as tabstop, setting this to 2 ensures that
" the tab stop is the same while I'm editing.
set softtabstop=2

" Ensures that <Tab>s are converted into spaces.
" We don't want any mix-ups here.
set smarttab

" Set a hard wrapping to 78 characters. Nothing should be
" longer than that.
set textwidth=78

" We POSIX.
set fileformats=unix

" Ignore a lot of stuff.
set wildmode=list:longest
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*

" Keep the currently edited line in the middle of the window.
set scrolloff=999
set sidescrolloff=2

" PASTE mo'fo!
set pastetoggle=<F2>

" Set a wrapping margin.
set wrap
set wrapmargin=2

" Use the clicking thing, Luke.
set mouse=a

" I place my tags all over the place. Bring them
" to me!
set tags+=$PWD/.git/tags
set tags+=$HOME/.tags/*.tags

" Save your work in sessions.
set sessionoptions=buffers,tabpages,winsize,curdir
set sessionoptions-=help,options,globals
"}}}

"{{{2 Layout

" Fold on the syntax.
set foldmethod=syntax

" Sets the width of the folding margins.
set foldcolumn=1

" Sets the minimum amount of lines needed to
" automatically initialize folding.
set foldminlines=5

" Set the title in the terminal.
set title titlelen=120 titlestring="%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)"

" Turn on the ruler, we'd like to know our whereabouts.
set ruler

" We like a stable number count.
set number numberwidth=2

" Ensure the visibility of the statusline.
" Required for vim-powerline.
set laststatus=2

" Trust me, Vim, we're running in a 256-colored terminal.
set t_Co=256

" Make sure our background's dark.
set background=dark

" Set our favorite color scheme.
colorscheme zenburn

"}}} 

"{{{2 Searching

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
set history=125

" Set the undo level to a little bit higher than default.
set history=1500
"}}}

"{{{2 Dictionary Options
set spelllang=en
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/dict.custom.utf8-8.add
"}}}

"{{{2 Visual Cues
" A problem that plagued me for months.
set fillchars=diff:⣿,vert:│
" A visual cue for line-wrapping.
set showbreak=↪
" Visual cues when in 'list' model.
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" Let me know what I just did.
set showcmd
" Speed things up in the console.
set ttyfast

augroup cline
  au!
  au WinLeave,InsertEnter * set cursorline cursorcolumn foldcolumn=0
  au WinEnter,InsertLeave * set cursorline nocursorcolumn foldcolumn=1
augroup END

augroup linetoggle
  autocmd!
  autocmd WinEnter * set number
  autocmd WinLeave * set nonumber
augroup END

" Make sure that GNU screen or tmux passes me my xkeys.
" link: http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term == "screen"
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" Do this when I hit <Backspace>
set backspace=indent,eol,start

"}}}
"}}}

"{{{1 Key bindings.
nnoremap ; : 
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
nnoremap <silent> <leader>j :setlocal spell!<CR>
imap <leader>pT <C-R>=strftime("%Y-%m-%d")<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap <silent> <leader>ev :tabe ~/.vimrc<cr> 
nmap <silent> <leader>sv :so ~/.vimrc<cr>
noremap <leader>i :set list!<cr>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
noremap <silent> <C-N> :tabp<CR>
noremap <silent> <C-M> :tabn<CR>
nnoremap <leader>c :setlocal cursorline! cursorcolumn!<CR>
noremap <leader>f gg=G
cnoremap help vert help
"}}}

" Update Vim's config when I edit the file.
autocmd BufWritePost .vimrc source $HOME/.vimrc

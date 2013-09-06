"" vim: textwidth=78 foldmethod=marker
"" Vim configuration options.
""
"" @author Jacky Alcine <me@jalcine.me>
"" @date   2013-08-05 13:19:47 EDT 
"" @vcs    https://github.com/jalcine/vimrc
""
"" I take pride in my Vim configuration. Being that I'm
"" an intermediate Vim user and I try to share as much
"" as I learn, I've taken the liberty of documenting and
"" explaining the nature of my configuration.
""
"" I use the latest development version of Vim from sources using a PPA in
"" Ubuntu.
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" We live in the future, don't worry about backwards
" compatibility with Vi.
set nocompatible

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

" Load plug ins, its configuration and mappings.
source ~/.vim/plugin/customconfig.vim
source ~/.vim/plugin/bundle.vim
source ~/.vim/plugin/custommappings.vim

" Activate plug in detection now.
filetype plugin indent on
" Let's enable some syntax highlighting as well.
syntax on
" Set the colorscheme now.
colorscheme jellybeans
" Make it dark.
set background=light

"{{{1 Immediate Configuration Options

" Use visual bells instead of beeps. I use this
" since it helps a lot with tmux to inform me
" to switch over to it. Also enable bells for errors.
set visualbell errorbells

" Gimme something to look at.
set laststatus=2

" Show me the tab bar no matter what.
set showtabline=2

"{{{2 Spacing

" I prefer to use two spaces to represent tabs.
set tabstop=2 softtabstop=2

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
set sessionoptions-=help,options,globals
"}}}

"{{{2 Layout

" We fold.
set foldenable

" Fold on the syntax.
set foldmethod=indent

" Sets the width of the folding margins.
set foldcolumn=2

" Sets the minimum amount of lines needed to
" automatically initialize folding.
set foldminlines=5

" Anything greater than this is automatically folded.
set foldlevel=2

" Set the title in the terminal.
set title titlelen=120 titlestring="%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)"

" Turn on the ruler, we'd like to know our whereabouts.
set ruler

" We like a stable number count.
set number numberwidth=2

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
set history=16384

" Set the undo level to a little bit higher than default.
set undolevels=16384
"}}}

"{{{2 Spelling Options
" Teach me howta spell, teach-teach me howta spell.
set spell

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
"}}}

"{{{2 Visual Cues
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.

set fillchars=diff:⣿,vert:│
" A visual cue for line-wrapping.
set showbreak=↪
" Visual cues when in 'list' model.
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" Show me these markings.
set list

" Update by redraw and not INS/DEL
set ttyfast ttyscroll=10

" Show me what I was doing.
set showcmd

" Let me know where I am.
set cursorline cursorcolumn

" Update Vim's config when I edit $MYVIMRC.
augroup autosourcevim
  au!
  au BufWritePost ~/.vimrc source $MYVIMRC | echomsg "[vim] Configuration sourced."
augroup END

augroup reformat
  au!
  au BufReadPost *.scss   setlocal ft=css.scss
  au BufReadPost *.coffee setlocal ft=javascript.cofeescript
augroup END

" Toggle the current cursor line whenever I swap windows.
augroup cline
  au!
  au WinLeave,InsertEnter * set cursorline
  au WinEnter,InsertLeave * set nocursorline
augroup END

" Automatically update tag linkages.
augroup gimmetags
  au!
  au FileReadPost  * call s:load_local_tags()<CR>
  au FileWritePost * call s:load_local_tags()<CR>
  au FileChangedShellPost * call s:load_local_tags()<CR>
augroup END

function! s:load_local_tags()
  set tags+=./.tags,./TAGS,./tags
  set tags+=.bzr/tags
  set tags+=.git/tags
  set tags+=.svn/tags
  set tags+=.hg/tags
  set tags+=build/tags
  echomsg "[ctags] Added VCS and potentially generated tag definition files."
endfunction

" Make sure that GNU screen or tmux passes me my xkeys.
" link: http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term == "screen" || &term == "screen-256color"
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" Do this when I hit <Backspace>.
set backspace=indent,eol,start

"}}}
"}}}

"{{{1 Key bindings.
" Key bindings are a developer's bread and butter. Over time, I remap and
" remap my keys to make my life as easy as possible. I've separated my generic
" mappings from my plug-in mappings intentionally, just for clarity.

" One less key to press to enter the Vim shell.
nnoremap ; :

" Toggle the use of list characters.
noremap <leader>i :set list!<cr>

" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>l :setlocal hlsearch!<CR>

" Toggle the state of spelling locally.
nnoremap <silent> <leader>j :setlocal spell!<CR>

" Toggle the visibility of cursor lines.
nnoremap <leader>c :setlocal cursorline!<CR>
nnoremap <leader>C :setlocal cursorcolumn!<CR>

" Toggle the current fold.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Inject the current date.
inoremap <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

" Inject the current time with the labelling of the time-zone.
inoremap <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>

" Inject the current date and time
inoremap <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>

" Toggle the light/dark state of Vim.
nnoremap <leader>a :call toggle_color()<CR>

" Disable classic arrow-key navigation in Normal mode.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Use Ctrl+S to save the contents of the current buffer. Reflex.
nnoremap <silent> <C-s> :w

" Edit and reload the master Vim configuration.
nnoremap <silent> <leader>ev :tabnew $MYVIMRC<cr> 
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" Jump between the current tabs.
noremap <silent> <C-H> :tabp<CR>
noremap <silent> <C-L> :tabn<CR>

" Formats the current buffer.
nnoremap <leader>f gg=G

" Make it a bit easier to navigate in the wildmenu.
cnoremap <Left> <Space><BS><Left>
cnoremap <Right> <Space><BS><Right>

" Bind make command.
" Make this only happen for Makefile projects.
nnoremap <leader>ba :make all<CR>
nnoremap <leader>bc :make clean<CR>
nnoremap <leader>bi :make install<CR>
nnoremap <leader>bu :make uninstall<CR>

" Travel over errors.
nnoremap <leader>ce <ESC>:cn<CR>
nnoremap <leader>cp <ESC>:cp<CR>
nnoremap <leader>co <ESC>:cwindow<CR>
nnoremap <leader>cf <ESC>:cfirst<CR>
nnoremap <leader>cl <ESC>:clast<CR>

" Rewrite 'vhe' to 'vert help'.
cnoremap vhe vert help
"}}}

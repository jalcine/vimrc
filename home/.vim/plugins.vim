" We turn off file-type detection for now, this is
" required for using Vundle.
filetype off

"{{{ Plug-ins

" I use Vundle as my plug-in management system.

"" Set up Vundle.
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'benmills/vimux'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'mattn/zencoding-vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'othree/html5.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-surround'
Bundle 'mattn/gist-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'chriskempson/tomorrow-theme', { "rtp" : "vim/" }
Bundle 'othree/html5.vim'
Bundle 'kaichen/vim-snipmate-ruby-snippets'
Bundle 'tisho/css-snippets-snipmate'
Bundle 'hlissner/vim-multiedit'
Bundle 'jamessan/vim-gnupg'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'mattn/webapi-vim'
Bundle 'tpope/vim-speeddating'
Bundle 'int3/vim-extradite'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
Bundle 'mmozuras/vim-github-comment'
Bundle 'juvenn/mustache.vim'
Bundle 'FredKSchott/CoVim'
Bundle 'gmarik/github-search.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-bufferline'
Bundle 'bling/vim-airline'
Bundle 'vim-perl/vim-perl'
Bundle 'flazz/vim-colorschemes'
Bundle 'skammer/vim-css-color'
Bundle 'junegunn/vim-github-dashboard'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jalcine/TaskList.vim'
Bundle 'jalcine/localrc.vim'
Bundle 'jalcine/vim-android'
Bundle 'jalcine/vim-snippets'
Bundle 'jalcine/cmake.vim'
Bundle 'jalcine/android-dev.vim'
"}}}

" Activate plugin detection now.
filetype plugin indent on
"}}}


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
Bundle 'tpope/vim-rbenv'
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
Bundle 'digitaltoad/vim-jade'
Bundle 'mattn/webapi-vim'
Bundle 'godlygeek/tabular'
Bundle 'aaronbieber/quicktask'
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

"{{{1 Plugin Configuration

"{{{2 User Info
let g:author="Jacky Alcine"
let g:email="me@jalcine.me"
let g:site="jalcine.me"

"{{{2 Airline config
let g:airline_theme="simple"
let g:airline_modified_detection=1
let g:airline_powerline_fonts=0

"{{{2 Syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_echo_current_error=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=0
let g:syntastic_quiet_warnings=1
let g:syntastic_cpp_compiler="clang++"
let g:syntastic_cpp_include_dirs=[ "$HOME/.local/include" ]
let g:syntastic_cpp_check_header=1

"{{{2 CtrlP
let g:ctrlp_switch_buffer="E"
let g:ctrlp_working_path_mode="rc"
let g:ctrlp_root_markers=[".localrc.vim", ".git", ".bzr", ".hg", ".svn"]
let g:ctrlp_open_new_file='t'
let g:ctrlp_open_multiple_files='t'
let g:ctrlp_cmd='CtrlP'

" {{{2 vim-session
let g:session_directory="~/.vim/sessions"
let g:session_default_name="default"
let g:session_autoload="no"
let g:session_autosave="yes"
let g:session_autosave_periodic="yes"
let g:session_command_aliases=1

"{{{2 Snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"{{{2 GitHub configuration
let g:github_user="jalcine"
let g:github_dashboard= { "username" : "jalcine", "emoji" : 1 }
let g:github_search_path_format = "$HOME/Development/Projects"
"}}}
"}}}

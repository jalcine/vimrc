" vim: set fdm=marker tw=78

if exists("g:is_my_vundle_loaded_yet")
  finish
endif

let g:is_my_vundle_loaded_yet=1

" We turn off file-type detection for now, this is
" required for using Vundle.
filetype off

"{{{ Plug-ins

" For my personal extension development, I use Vundle. Use it.
set rtp+=~/.vim/bundle/vundle

" Invoke the swag!
call vundle#rc()

" Keep Vundle up to date.
" {{{ Libraries
Bundle 'gmarik/vundle'
Bundle 'xolox/vim-misc'
Bundle 'mattn/webapi-vim'
" }}}

"{{{ Core function
"  These plugins provide the root functionality of my Vim setup.
"  I don't see me using Vim without these guys.

" Make GVim themes work ootb in CVim.
Bundle "godlygeek/csapprox"

" Universal editor support
Bundle "editorconfig/editorconfig-vim"

" Add indentation lines.
Bundle "Yggdroot/indentLine"

" Provides a means of quick-n-easy pair programming. Just add water.
Bundle 'FredKSchott/CoVim'

" Tmux keybindings into Vim.
Bundle 'benmills/vimux'

" Lightweight modular status-line.
Bundle 'bling/vim-airline'

" Improved session support.
Bundle 'xolox/vim-session'

" Tasks just like Eclipse, yo.
Bundle 'jalcine/TaskList.vim'

" Load local configuration.
Bundle 'jalcine/localrc.vim'

" Show me the tags!
Bundle 'majutsushi/tagbar'

" Support for Markdown in Tagbar
Bundle 't4ku/marktag'

" Incorporate CMake support.
Bundle 'jalcine/cmake.vim'

" Incorporate Android support.
Bundle 'jalcine/android.vim'
"}}} 

"{{{ Editing Extensbility

" Tweak dates + times on-the-fly.
Bundle 'tpope/vim-speeddating'

" Tweaked text indentation for Vim.
Bundle 'godlygeek/tabular'

" Transparent GNUPG editing of files.
Bundle 'jamessan/vim-gnupg'

" Awesome jazz.
Bundle "scrooloose/syntastic"

" Super-charged file navigation.
Bundle 'scrooloose/nerdtree'

" Make NERDTree into all of the TABS!
Bundle 'jistr/vim-nerdtree-tabs'

" Advanced commenting for Vim.
Bundle 'scrooloose/nerdcommenter'

" Advanced TODO support in Vim.
Bundle 'aaronbieber/quicktask'

" Kickass multiline editing.
Bundle 'hlissner/vim-multiedit'

" A useful completer.
Bundle "Valloric/YouCompleteMe"

" Formatting tools.
Bundle "einars/js-beautify"
Bundle "Chiel92/vim-autoformat"
"}}}

"{{{ VCS
" Let us know what happens in files.
Bundle 'mhinz/vim-signify'

" Added function for vim-fugitive
Bundle 'int3/vim-extradite'

" Oh so bad, you.
Bundle 'tpope/vim-fugitive'

" Formatting for Git files (.git/COMMIT_MSG and the like).
Bundle 'tpope/vim-git'
"}}}

"{{{ Formatting
" HAML (.haml) formatting support.
Bundle 'tpope/vim-haml'

" Markdown (.md, .markdown) formatting support.
Bundle 'tpope/vim-markdown'

" CoffeeScript fomatting support.
Bundle 'kchmck/vim-coffee-script'

" JavaScript formatting support.
Bundle 'pangloss/vim-javascript'

" JSON formatting support.
Bundle 'helino/vim-json'

" LESS formatting support.
Bundle 'groenewege/vim-less'

" JADE formatting support.
Bundle 'digitaltoad/vim-jade'

" Perl formatting support.
Bundle 'vim-perl/vim-perl'

" HTML5 formatting support.
Bundle 'othree/html5.vim'

" Background color for CSS/SCSS highlighting.
Bundle 'skammer/vim-css-color'
"}}}

"{{{ Ruby
" Get some Bundle handles.
Bundle 'tpope/vim-bundler'

" Handle some rbenv triggers.
Bundle 'tpope/vim-rbenv'
"}}}

"{{{ GitHub TOOLS <3
" From Vim to Gist.
Bundle 'mattn/gist-vim'

" Search for shit on GitHub.
Bundle 'gmarik/github-search.vim'

" Check out activity and dashboards on GitHub.
Bundle 'junegunn/vim-github-dashboard'

" Add comments to code in GitHub.
Bundle 'mmozuras/vim-github-comment'

" 
"}}}

"{{{ Snippet and Completion Tools

" Snippet manager.
Bundle 'SirVer/ultisnips'

" My personal fork + build of snippets.
Bundle 'jalcine/vim-snippets'

" File and buffer search tool.
Bundle 'kien/ctrlp.vim'
"}}}

"{{{ Coloring and UI
" Awesome ass themes for Vim.
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes" }

" Massive list of color themes.
Bundle 'flazz/vim-colorschemes'

" Tomorrow Theme.
Bundle 'chriskempson/tomorrow-theme', { "rtp" : "vim" }
"}}}

"}}}

"}}}

" Activate plugin detection now.
filetype plugin indent on

" Let's enable some syntax highlighting as well.
syntax on
" Define the color scheme to be this nice poppy one!
colorscheme Tomorrow-Night-Eighties

"{{{1 Plugin Configuration

"{{{2 User Info
let g:author="Jacky Alcine"
let g:email="me@jalcine.me"
let g:site="jalcine.me"
let g:username="jalcine"

"{{{2 CMake configuration
let g:cmake_use_vimux=0

"{{{2 Airline config
let g:airline_theme="tomorrow"
let g:airline_modified_detection=1
let g:airline_powerline_fonts=1

"{{{2 YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = "$HOME/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.', '('],
      \   'objc' : ['->', '.'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::', '('],
      \   'perl' : ['->', '('],
      \   'php' : ['->', '::', '('],
      \   'cs,java,javascript,d,vim18:19:47 EDTthon,perl6,scala,vb,elixir,go' : ['.', '('],
      \   'ruby' : ['.', '::', '('],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \ }

"{{{2 Syntastic options
let g:syntastic_enable_signs=1
let g:syntastic_echo_current_error=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=0
let g:syntastic_quiet_warnings=1

" Define checkers

" C++ specific options
let g:syntastic_cpp_compiler="gcc"
let g:syntastic_cpp_include_dirs=[ "$HOME/.local/include", "/usr/include", "/usr/local/include" ]
let g:syntastic_cpp_check_header=1

" Ruby specific options
" let g:syntastic_ruby_exec = system("rbenv which ruby")

"{{{2 CtrlP
let g:ctrlp_switch_buffer="E"
let g:ctrlp_working_path_mode="rc"
let g:ctrlp_root_markers=[".localrc.vim", ".git", ".bzr", ".hg", ".svn"]
let g:ctrlp_open_new_file='t'
let g:ctrlp_open_multiple_files='t'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_extensions = [ 'tag', 'buffertag', 'quickfix', 'bookmarkdir', 'mixed', 'line', 'changes', 'undo']

"{{{2 indentLine
let g:indentLine_char="┆"
"}}}

" {{{2 vim-session
let g:session_directory="~/.vim/sessions"
let g:session_default_name="default"
let g:session_autoload="no"
let g:session_autosave="yes"
let g:session_autosave_periodic=2
let g:session_command_aliases=1

"{{{2 Snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

"{{{2 Android
let g:android_default_package_path = "me.jalcine"
let g:android_default_project_path = "$HOME/Development/Projects"


"{{{2 GitHub configuration
let g:github_user=g:username
let g:github_dashboard= { "username" : g:username, "emoji" : 1 }
let g:github_search_path_format = "$HOME/Development/Projects"
let g:github_comment_open_browser = 1
"}}}

"{{{2 Vimux 
let g:VimuxPromptString = "CMD? "
let g:VimuxUseNearesPane = 1
let g:VimuxOrientation = "v"
"}}}

"{{{2 tagbar
let g:tagbar_ctags_bin="/usr/bin/ctags"
let g:tagbar_compact=1
let g:tagbar_show_visibility=1
let g:tagbar_ctagsargs=[]
let g:tagbar_show_linenumbers=1
let g:tagbar_sort=1
"}}}

"}}}
"
"{{{1 Plugin Mappings

nnoremap <F3> :Autoformat<CR><CR>

"{{{2 Tabularize
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
"}}}

"{{{2 Vimux
nnoremap <Leader>to :VimuxOpenPane<CR>
nnoremap <Leader>tp :VimuxPromptCommand<CR>
nnoremap <Leader>tt :VimuxRunLastCommand<CR>
nnoremap <Leader>tc :VimuxCloseRunner<CR>
vnoremap <Leader>ts "vy :call VimuxRepl()<CR>
nnoremap <Leader>ts vip<LocalLeader>ts<CR>

function! VimuxRepl()
  call VimuxSendText(@v)
  call VimuxSendKeys("<Enter>")
endfunction

"}}}

"}}}

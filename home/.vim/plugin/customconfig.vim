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

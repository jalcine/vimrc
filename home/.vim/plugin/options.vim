if exists('g:jalcine_options')
	finish
endif

let g:jalcine_options=1
let g:snips_author="Jacky Alcine <me@jalcine.me>"

" {{{ NERD{Tree,Commenter}
let g:NERDCreateDefaultMappings=1
" }}}

" {{{ Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:synastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=2
let g:syntastic_auto_loc_list=2
let g:syntastic_loc_list_height=5
let g:syntastic_ignore_files = ['\m^/usr/include/']
let g:syntastic_mode_map = {
			\ 'mode': 'active',
			\ 'active_filetypes': ['ruby', 'javascript', 'sass', 'haml', 'sh'],
			\ 'passive_filetypes': ['cpp', 'html', 'perl', 'python']
			\ }
let g:syntastic_javascript_checkers=['jscs', 'jslint', 'jshint']
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers=['mri', 'rubylint']
let g:syntasitc_perl_checkers=['perl']
let g:syntastic_python_checkers=['pylint','pep8','python']
let g:syntastic_cpp_checkers=['gcc','cppcheck','cpplint']
let g:syntastic_c_checkers=['gcc','make','cppcheck']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_vim_checkers=['vimlint']
let g:syntastic_ruby_exec=substitute(system('which ruby'),'\n','','g')
let g:syntastic_jshint_exe='jshint'
"let g:syntastic_javascript_eslint_conf=''
" }}}

" {{{ Tern
let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum=1
" }}}

" {{{ Airline
let g:airline_detected_modified=1
let g:airline_powerline_fonts=1
let g:airline_detect_iminsert=0
let g:airline#extensions#hunks#non_zero_only=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline_mode_map={
			\ '__' : '-',
			\ 'n'  : 'NORM',
			\ 'i'  : 'INSR',
			\ 'R'  : 'RPLC'
			\ }
" }}}

" {{{ Unite
let g:unite_source_history_yank_enable=1
let g:unite_winheight=10
let g:unite_data_directory='~/.vim/cache-unite'
let g:unite_source_rec_max_cache_files=500
let g:unite_enable_start_insert=0
let g:unite_source_grep_command='ag'
let g:unite_source_grep_recursive_opts=''
let g:unite_source_grep_default_opts='--nocolor --nogroup --column'
let g:unite_prompt='» '
" }}}

" {{{ Ultisnips
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["Ultisnips"]
" }}}

" {{{ Tagbar
let g:tagbar_compact=0
let g:tagbar_autoshowtag=1
" }}}

" {{{ vim-session
let g:session_autoload="no"
let g:session_autosave="no"
let g:session_command_aliases=1
let g:session_default_name="default"
let g:session_directory="~/.vim/sessions"
" }}}

" {{{ Git, Github and VCS
let g:github_user='jalcine'
let g:github_dashboard = { 'username': g:github_user }
let g:github_dashboard['position'] = 'bottom'
let g:github_dashboard['emoji'] = 0
let g:github_dashboard['emoji_map'] = {
			\   'user_dashboard': 'blush',
			\   'user_activity':  'smile',
			\   'repo_activity':  'laughing',
			\   'ForkEvent':      'fork_and_knife'
			\ }

" }}}

let g:goyo_linenr=1
let g:used_javascript_libs='jasmine,backbone,underscore,jquery'

let g:CSApprox_hook_post = ['hi Normal  ctermbg=NONE',
			\ 'hi FoldColumn ctermbg=NONE',
			\ 'hi SignColumn ctermbg=NONE',
			\ 'hi LineNr     ctermbg=NONE',
			\ 'hi VertSplit  ctermbg=NONE',
			\ ]

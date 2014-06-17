" vim: ft=vim fdm=marker tw=78 fdl=0
if exists('g:jalcine_options')
  finish
endif

let g:jalcine_options=1
let g:goyo_linenr=1
let g:used_javascript_libs='jasmine,backbone,jquery,lodash'

" {{{ NERD{Tree,Commenter}
let g:NERDCreateDefaultMappings=1
let g:NERDCompactSexyComs=1
" }}}
" {{{ Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_ignore_files = ['\m^/usr/include/', 'node_modules']
let g:syntastic_mode_map = { 'mode': 'active' }
" {{{ Checkers for Syntastic
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers=['mri', 'rubylint', 'rubocop']
let g:syntastic_perl_checkers=['perl','perlcritic','podchecker']
let g:syntastic_python_checkers=['pylint','pep8','python']
let g:syntastic_cpp_checkers=['gcc','cppcheck','cpplint']
let g:syntastic_c_checkers=['gcc','make','cppcheck']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_vim_checkers=['vimlint']
" }}}
let g:syntastic_ruby_exec=substitute(system('which ruby'),'\n','','g')
let g:syntastic_yaml_checkers=['jsyaml']
let g:syntastic_jshint_exe='jshint'
" }}}
" {{{ Signify
let g:signify_vcs_list=['git']
let g:signify_disable_by_default=0
if v:version >= 703 | let g:signify_sign_overwrite=1 | endif
let g:signify_sign_add='+'
let g:signify_sign_change='!'
let g:signify_sign_delete='_'
let g:signify_sign_delete_first_line='‾'
" }}}
" {{{ Tern
let g:tern_show_argument_hints='on_hold'
let g:tern_show_signature_in_pum=1
" }}}
" {{{ Airline
let g:airline_theme='laederon'
let g:airline_detected_modified=1
let g:airline_powerline_fonts=0
let g:airline_detect_iminsert=0
let g:airline#extensions#hunks#non_zero_only=1
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline#extensions#whitespace#show_message=1
let g:airline#extensions#whitespace#trailing_format='sp: [%s]'
let g:airline#extensions#whitespace#mixed_indent_format='mi: [%s]'
let g:airline_mode_map={
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'VB'
      \ }
" }}}
" {{{ Unite
let g:unite_source_history_yank_enable=1
let g:unite_winheight=6
let g:unite_data_directory='~/.vim/cache-unite'
let g:unite_source_rec_max_cache_files=500
let g:unite_enable_start_insert=1
let g:unite_prompt='UNITE » '
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_recursive_opts=''
  let g:unite_source_grep_default_opts='--nocolor --nogroup --column'
endif
" }}}
" {{{ Ultisnips
let g:snips_author="Jacky Alcine <me@jalcine.me>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["Ultisnips"]
" }}}
" {{{ Tagbar
let g:tagbar_compact=1
let g:tagbar_autoshowtag=1
" }}}
" {{{ vim-session
let g:session_autoload="no"
let g:session_autosave="yes"
let g:session_command_aliases=1
let g:session_default_name="default"
let g:session_directory="~/.vim/sessions"
" }}}
" {{{ Git, Github and VCS
let g:github_user='jalcine'
let g:github_dashboard = { 'username': g:github_user }
let g:github_dashboard['position'] = 'bottom'
let g:github_dashboard['emoji'] = 1
let g:github_dashboard['emoji_map'] = {
      \   'user_dashboard': 'blush',
      \   'user_activity':  'smile',
      \   'repo_activity':  'laughing',
      \   'ForkEvent':      'fork_and_knife'
      \ }

" }}}
" {{{ JavaScript options
let g:javascript_enable_domhtmlcss=1
let g:javascript_conceal=1
" }}}
" {{{ Colorscheme Specific 
let g:pencil_neutral_headings=0
let g:pencil_higher_contrast_ui=1
" }}}

" vim: ft=vim fdm=marker tw=78 fdl=0
if exists('g:jalcine_options')
  finish
endif

let base16colorspace=256

" {{{ NERD{Tree,Commenter}
let g:NERDCreateDefaultMappings=1
let g:NERDTreeMinimalUI=0
let g:NERDCompactSexyComs=1
" }}}

" {{{ CMake
let g:cmake_exec = {
  \ 'async': 'dispatch',
  \ 'sync': 'dispatch',
  \ }
let g:cmake_extensions = ['syntastic', 'ycm']
" }}}

" {{{ Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_ballons=has('ballon_eval')
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_ignore_files = ['\m^/usr/', 'node_modules']
let g:syntastic_mode_map = { 'mode': 'active' }
" {{{ Checkers for Syntastic
let g:syntastic_javascript_checkers=['jshint', 'jscs']
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_perl_checkers=['perl','perlcritic','podchecker']
let g:syntastic_python_checkers=['pylint','pep8','python']
let g:syntastic_cpp_checkers=['gcc','cppcheck','cpplint']
let g:syntastic_c_checkers=['gcc','make','cppcheck']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['jshint']
let g:syntastic_yaml_checkers=['jsyaml']
let g:syntastic_sh_checkers=['sh','shellcheck','checkbashisms']
let g:syntastic_vim_checkers=['vimlint']
" }}}
let g:syntastic_ruby_exec=substitute(system('which ruby'),'\n','','g')
let g:syntastic_jshint_exe=substitute(system('which jshint'),'\n','','g')
let g:syntastic_enable_perl_checker=1
let g:syntastic_c_clang_tidy_sort=1
let g:syntastic_c_clang_check_sort=1
let g:syntastic_c_remove_include_errors=1
" }}}

" {{{ Airline
let g:airline_theme='base16'
let g:airline_detected_modified=1
let g:airline_powerline_fonts=1
let g:airline_detect_iminsert=1
let g:airline#extensions#hunks#non_zero_only=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo=1
let g:airline#extensions#whitespace#show_message=1
let g:airline#extensions#whitespace#trailing_format='s [%s]'
let g:airline#extensions#whitespace#mixed_indent_format='i [%s]'
let g:airline_mode_map={
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'B'
      \ }
" }}}

" {{{ Unite
let g:unite_source_history_yank_enable=1
let g:unite_winheight=5
let g:unite_data_directory='~/.vim/cache-unite'
let g:unite_source_rec_max_cache_files=500
let g:unite_enable_start_insert=1
let g:unite_prompt='» '
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
let g:unite_source_grep_recursive_opt = ''
" }}}

" {{{ Ultisnips
let g:snips_author="Jacky Alcine <me@jalcine.me>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["Ultisnips"]
" }}}

" {{{ Other
let g:jalcine_options=1
let g:goyo_linenr=1
let g:used_javascript_libs='jasmine,backbone,jquery,lodash'
let g:vundle_lazy_load=1
let g:ycm_show_diagnostics_ui=0
let g:ackprg='ag'
" }}}

" {{{ Tagbar
let g:tagbar_compact=0
let g:tagbar_autoshowtag=0
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
let g:github_access_token=readfile(expand('~/.github_access_token'), '', '1')[0]
let g:github_upstream_issues=1
let g:github_search_path_format='$HOME/Development/Projects/:project'
let g:github_comment_open_browser = 1
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
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
" }}}

" {{{ Colorscheme Specific
let g:ruby_fold=1
let g:sh_fold_enabled=7

" {{{ Perl Options
let g:perl_fold=1
let g:perl_fold_anonymous_subs=0
let g:perl_fold_blocks=1
let g:perl_include_pod=1
let g:perl_nofold_packages=0
let g:perl_nofold_subs=0
let g:perl_sync_dist=50
" }}}

" {{{ C/C++ specifics
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1
let g:c_comment_strings=1
let g:c_curly_errors=1
let g:c_gnu=0
let g:c_no_c99=1
let g:c_space_errors=1
" }}}

let g:easytags_async=1
"let g:easytags_syntax_keyword = 'always'
let g:easytags_dynamic_files = 1
let g:easytags_include_members = 1
let g:easytags_suppress_report = 1

if filereadable('~/.vim/plugin/options.local.vim')
  source ~/.vim/plugin/options.local.vim
endif
"}}}

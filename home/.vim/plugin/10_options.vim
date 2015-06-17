" vim: fdm=marker tw=78 fdl=1 :
" File: plugin/10_options.vim
" Author: Jacky Alcine <me@jalcine.me>
" Description: Options for plugins.
" Last Modified: February 02, 2015

if exists('g:jalcine_options')
  finish
endif

let base16colorspace = 256
let g:ansible_options = { 'ignore_blank_lines': 0 }

" {{{ NERDTree + NERDCommenter
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDCompactSexyComs = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeShowBookmarks = 1
" }}}

" {{{ CMake
let g:cmake_exec = {
      \ 'async': 'dispatch',
      \ 'sync': 'dispatch',
      \ }
let g:cmake_extensions = ['syntastic', 'ycm']
" }}}

" {{{ Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_ballons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 3
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 10
let g:syntastic_ignore_files = ['^/usr/', '*node_modules*', '*vendor*',
      \ '*build*', '*LOCAL*', '*BASE', '*REMOTE*']
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes' : ["ruby", "php", "sh", "python"]
      \ }
" {{{ Checkers for Syntastic
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_json_checkers = ['jsonlint', 'jsonval']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_perl_checkers = ['perl', 'perlcritic', 'podchecker']
let g:syntastic_python_checkers = ['pylint', 'pep8', 'python']
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck', 'cpplint', 'ycm', 'clang_tidy', 'clang_check']
let g:syntastic_c_checkers = ['gcc', 'make', 'cppcheck', 'clang_tidy', 'clang_check', 'ycm']
let g:syntastic_haml_checkers = ['haml_lint', 'haml']
let g:syntastic_html_checkers = ['jshint']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_sh_checkers = ['sh', 'shellcheck', 'checkbashisms']
let g:syntastic_vim_checkers = ['vimlint']
" }}}
let g:syntastic_enable_perl_checker = 1
let g:syntastic_c_clang_tidy_sort = 1
let g:syntastic_c_clang_check_sort = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_clang_tidy_sort = 1
let g:syntastic_cpp_clang_check_sort = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_quiet_messages = { "level": "[]", "file": ['*_LOCAL_*', '*_BASE_*', '*_REMOTE_*']  }
let g:syntastic_stl_format = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'
let g:syntastic_java_javac_options = "-g:none -source 8 -Xmaxerrs 5 -Xmaswarns 5"
" }}}

" {{{ Airline
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'B'
      \ }
" }}}

" {{{ Unite
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = '~/.vim/cache-unite'
let g:unite_source_rec_max_cache_files = 1000
let g:unite_source_grep_max_candidates = 500
let g:unite_enable_start_insert = 1
let g:unite_prompt = '» '
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
" }}}

" {{{ Ultisnips
let g:snips_author                 = 'Jacky Alcine <me@jalcine.me>'
let g:UltiSnipsEnableSnipMate      = 1
let g:UltiSnipsEditSplit           = 'context'
let g:UltiSnipsExpandTrigger       = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger  = '<c-k>'
let g:UltiSnipsSnippetDirectories  = ['Ultisnips']
" }}}

" {{{ Other
let g:vundle_lazy_load = 1
let g:ycm_show_diagnostics_ui = 0
if executable('ag')
  let g:ackprg = 'ag'
endif
" }}}

" {{{ Tagbar
let g:tagbar_compact = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_zoomwidth = 20
let g:tagbar_left = 0
let g:tagbar_sort = 1
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : 'markdown2ctags',
    \ 'ctagsargs' : '-f - --sort = yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
" }}}

" {{{ vim-session
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_command_aliases = 1
let g:session_default_name = "default"
let g:session_directory = "~/.vim/sessions"
" }}}

" {{{ Git, Github and VCS
let g:github_user = 'jalcine'
let g:github_upstream_issues = 1
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
let g:gitgutter_sign_added            = '✏️'
let g:gitgutter_sign_modified         = '➰'
let g:gitgutter_sign_removed          = '#'
let g:gitgutter_sign_modified_removed = '@'
" }}}

" {{{ JavaScript options
let g:javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
" }}}

" {{{ Colorscheme Specific
let g:ruby_fold = 1
let g:sh_fold_enabled = 7
" }}}

" {{{ Perl Options
let g:perl_fold = 1
let g:perl_fold_anonymous_subs = 0
let g:perl_fold_blocks = 1
let g:perl_include_pod = 1
let g:perl_nofold_packages = 0
let g:perl_nofold_subs = 0
let g:perl_sync_dist = 50
" }}}

" {{{ C/C++ specifics
let g:load_doxygen_syntax = 1
let g:doxygen_enhanced_color = 0
let g:c_comment_strings = 1
let g:c_curly_errors = 1
let g:c_gnu = 1
let g:c_no_c99 = 1
let g:c_space_errors = 1
" }}}

" {{{ Easytag
let g:easytags_async = 1
let g:easytags_suppress_report = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
" TODO: Add support for phpctags.
" TODO: Add support for jsctags.
" TODO: Add support for markdownctags.
" }}}

" {{{ ftplugin options
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:vim_indent_cont = &sw
" }}}

" {{{ Markdown
let g:vim_markdown_frontmatter = 1
" }}}

if filereadable($HOME . '/.vim/options.local.vim')
  source $HOME/.vim/options.local.vim
endif
"}}}

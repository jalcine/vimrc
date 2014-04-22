if exists('g:jalcine_options')
  finish
endif

let g:jalcine_options=1

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
let g:unite_data_directory='~/.vim/cache/unite'
let g:unite_source_rec_max_cache_files=5000
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
" }}}

let g:goyo_linenr=1
let g:used_javascript_libs='jasmine,backbone,underscore,jquery'

" File:          init.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Entry point of all of my configuration.
" Last Modified: August 08, 2017
"
" This is where I tell Neovim to do my bidding. Yes, I have over
" 100+ plugins. No, Neovim does not run slow.
"
" vim: set fdm=marker foldlevel=0 :

set encoding=UTF-8 fileencoding=UTF-8
scriptencoding UTF-8

let vimrc_root = fnamemodify($MYVIMRC, ':p:h')
exec "let $PATH=\"" . vimrc_root . "/node_modules/.bin:\" . $PATH"

" {{{ settings

set laststatus=2
set ruler number numberwidth=6 relativenumber
set nocursorline nocursorcolumn
set sidescrolloff=1 sidescroll=1
set conceallevel=3 concealcursor=nivc
set foldenable foldminlines=5 foldmethod=syntax foldlevel=2
set nowrap
set signcolumn=yes
set shortmess+=c
set hidden
set pumheight=5
set noshowmode noshowmatch
set lazyredraw
set spelllang=en_us
set noshowcmd
set maxfuncdepth=4096
set inccommand=nosplit
set redrawtime=10

if has('termguicolors') " set true colors
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif

set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-
set showbreak=↪
set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\

set regexpengine=1

set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=5000

set backup writebackup
set backupdir=$HOME/.config/nvim/backup

set noswapfile

set tabstop=2 softtabstop=2
set shiftwidth=2 textwidth=80
set smarttab expandtab
set shiftround

set ignorecase smartcase
set laststatus=2 cmdheight=2
set incsearch hlsearch

set tags+=./tags,./.tags,./.vimtags
set tags+=tags,.tags,.vimtags
set tags+=$HOME/.config/nvim/tags/*
set nocscopetag

" }}}

iabbrev myemail yo@jacky.wtf
iabbrev myname Jacky Alciné
iabbrev me_fname Jacky
iabbrev me_lname Alciné
iabbrev me_site https://jacky.wtf

" {{{ local funcs
func! s:enhance_prose() abort
  let l:is_in_text = (&filetype ==# 'text')
  setlocal foldlevel=6
  setlocal conceallevel=2

  call textobj#quote#init({
        \ 'educate': l:is_in_text
        \ })
  call textobj#sentence#init()
  call litecorrect#init()
  call pencil#init({
        \ 'wrap': 'soft',
        \ 'autoformat': 1
        \ })
  call lexical#init()

  nmap <buffer> <silent> Q gqap
  xmap <buffer> <silent> Q gq
  nmap <buffer> <silent> <leader>Q vapJgqap
  nmap <buffer> <c-s> [s1z=<c-o>
  imap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »
endfunc

func! s:adapt_terminal() abort
  setl noruler nocursorcolumn nocursorline norelativenumber nonumber
  setl signcolumn=no foldcolumn=0
  silent! IndentLinesDisable
endfunc

func! s:terminal_kill_extra_buffers() abort
  silent! TagbarClose
  silent! cclose
  silent! lclose
  silent! MerginalClose
  silent! bd Merginal:branchList
endfunc

func! s:php_invoke(cmd) abort
  if     a:cmd ==# 'sortuse' | call PhpInsertUse()
  elseif a:cmd ==# 'expandclass' | call PhpExpandClass()
  elseif a:cmd ==# 'insertuse' | call PhpInsertUse()
  endif
endfunc

func! s:LaunchNoteOfTheDay() abort
  execute ':Note Morning Entries/' . strftime('%Y-%m-%d')
endfunc

func! s:VagrantTransform(cmd) abort
  let l:vagrant_project = get(matchlist(join(readfile('Vagrantfile'), '\n'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  return 'vagrant ssh --command '.shellescape('cd ' . l:vagrant_project . '; '.a:cmd)
endfunction

func! s:DockerTransform(cmd) abort
  return 'docker run ' . g:test_docker_container . ' '.shellescape(a:cmd)
endfunction

func! s:DockerComposeTransform(cmd) abort
  return 'docker-compose run ' . b:test_docker_compose_service . ' '.shellescape(a:cmd)
endfunction

func! s:goyo_enter() abort
  Limelight
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  TagbarClose
endfunction

func! s:goyo_leave() abort
  set scrolloff=5
  set showcmd
  set showmode
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  silent !tmux set status on
  Limelight!
endfunction

func! s:apply_bulk_mappings(mappings_list, opts) abort " {{{
  for l:a_mapping in a:mappings_list
    let l:command = l:a_mapping[0]
    let l:map_format = 'map'

    if has_key(a:opts, 'prefix')
      let l:command = a:opts.prefix . l:command
    endif

    if has_key(a:opts, 'remap')
      let l:map_format = 'noremap'
    endif

    if has_key(a:opts, 'silent')
      let l:map_format .= ' <silent>'
    endif

    let l:modes = get(l:a_mapping, 2, 'n')
    let l:idx = 0
    while l:idx < len(l:modes)
      let l:mode = l:modes[l:idx : 1]
      let l:exc_cmd = l:mode . l:map_format
            \ . s:mappings.leader . l:command
            \ . ' '
            \ . get(l:a_mapping, 1)
      exec l:exc_cmd
      let l:idx += 1
    endwhile
  endfor
endfunc " }}}
" }}}
"
" Plugins {{{
filetype off
call plug#begin(expand('$HOME/.config/nvim/plugins'))

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-vinegar'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dotenv'
      \ | Plug 'direnv/direnv.vim'
      \ | Plug 'wincent/terminus'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-commentary'
      \ | Plug 'cbaumhardt/vim-commentary-boxed'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
      \ | Plug 'xolox/vim-notes'
      \ | Plug 'vim-scripts/utl.vim'
      \ | Plug 'bpstahlman/txtfmt'
      \ | Plug 'powerman/vim-plugin-AnsiEsc'
      \ | Plug 'zhm/TagHighlight'
Plug 'tpope/vim-fugitive'
      \ | Plug 'tpope/vim-rhubarb'
      \ | Plug 'int3/vim-extradite'
      \ | Plug 'tommcdo/vim-fubitive'
      \ | Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'idanarye/vim-merginal'
Plug 'mattn/webapi-vim'
      \ | Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'bfrg/vim-cpp-modern'
Plug 'junkblocker/patchreview-vim'
Plug 'codegram/vim-codereview'
Plug 'chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'gabrielelana/vim-markdown'
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'arakashic/chromatica.nvim',
      \ {'for': ['cpp', 'c'] }
Plug 'mhinz/vim-signify'
Plug 'lilydjwg/colorizer', {'for': ['css', 'scss']}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
      \ | Plug 'junegunn/fzf.vim'
      \ | Plug 'fszymanski/fzf-gitignore', { 'do' : ':UpdateRemotePlugins' }
      \ | Plug 'tweekmonster/fzf-filemru'
Plug 'moll/vim-node'
Plug 'KabbAmine/zeavim.vim'
Plug 'vim-airline/vim-airline' |
      \ Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch' |
      \ Plug 'radenling/vim-dispatch-neovim'
Plug 'tmux-plugins/vim-tmux'
      \ | Plug 'tmux-plugins/vim-tmux-focus-events'
      \ | Plug 'MikeDacre/tmux-zsh-vim-titles'
Plug 'Shougo/echodoc.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-rooter'
Plug 'raimondi/delimitmate'
Plug 'godlygeek/tabular'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/vim-pyenv', { 'for': 'python' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'othree/jspc.vim'
Plug 'sirver/ultisnips'
      \ |  Plug 'honza/vim-snippets'
Plug 'kana/vim-textobj-user'
      \ | Plug 'reedes/vim-textobj-sentence'
      \ | Plug 'reedes/vim-textobj-quote'
      \ | Plug 'reedes/vim-pencil'
      \ | Plug 'reedes/vim-lexical'
      \ | Plug 'reedes/vim-litecorrect'
Plug 'vim-scripts/dbext.vim'
Plug 'ncm2/ncm2'
      \ | Plug 'ncm2/ncm2-match-highlight'
      \ | Plug 'ncm2/ncm2-bufword'
      \ | Plug 'ncm2/ncm2-tagprefix'
      \ | Plug 'ncm2/ncm2-path'
      \ | Plug 'ncm2/ncm2-ultisnips'
      \ | Plug 'ncm2/ncm2-tern', {
      \ 'for': 'javascript'
      \ }
      \ | Plug 'ncm2/ncm2-cssomni', {
      \ 'for': 'css'
      \ }
      \ | Plug 'ncm2/nvim-typescript', {
      \ 'do': 'bash ./install.sh'
      \ }
Plug 'terryma/vim-multiple-cursors'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'roxma/vim-tmux-clipboard'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'thinca/vim-ref'
Plug 'ryanoasis/vim-devicons'
Plug 'chriskempson/base16-vim'
Plug 'mattesgroeger/vim-bookmarks'

call plug#end()
" }}}

" {{{ Options
" {{{2 python
let g:pyenv#auto_activate = 1
let g:pyenv#auto_create_ctags = 1
let g:pyenv#auto_assign_ctags = 1
let g:python_highlight_all = 1
let g:python_slow_sync = 0
" }}}
"
" {{{2 vim-bookmarks
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
" }}}
"
" {{{2 signify
let g:signify_vcs_list = [ 'git', 'bzr' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
" 2}}}

if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

let g:nvim_typescript#type_info_on_hold = 0
let g:nvim_typescript#vue_support = 0
" }}}
"
" {{{2 ale
let g:ale_command_wrapper = 'nice -n4'
let g:ale_completion_enabled = 0
let g:ale_c_gcc_options = '-std=c++17 -Wall -Werror'
let g:ale_c_clang_options = '-std=c++17 -Wall -Werror'
let g:ale_c_parse_compile_commands = 1
let g:ale_c_parse_makefile = 0
let g:ale_c_build_dir = 'build'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Werror'
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Werror'
let g:ale_cpp_parse_compile_commands = 1
let g:ale_cpp_parse_makefile = 0
let g:ale_cpp_build_dir = 'build'
let g:ale_echo_delay = 1
let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_history_enabled = 1
let g:ale_history_log_output = 1
let g:ale_php_langserver_executable = 'phpenv exec ' . vimrc_root . '/plugins/LanguageServer-php-neovim/vendor/bin/php-language-server.php'
let g:ale_php_phpcbf_executable = 'phpenv exec composer exec phpcbf'
let g:ale_php_phpcs_executable = 'phpenv exec composer exec phpcs'
let g:ale_set_ballons = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']
let g:ale_typescript_tslint_ignore_empty_files = 1
let g:ale_typescript_tslint_use_global = 0

let s:ale_linters = {
      \ 'vue': ['vls'],
      \ 'typescript': ['tslint', 'tsserver'],
      \ 'javascript': ['importj'],
      \ 'elixir': ['mix', 'dogma', 'dialyxir', 'credo'],
      \ 'cpp': ['ccls', 'clang', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cppcheck', 'cpplint', 'cquery', 'flawfinder', 'gcc', 'ccls', 'clang', 'clangcheck', 'clangd', 'clangtidy', 'clazy', 'cppcheck', 'cpplint', 'cquery', 'flawfinder', 'gcc'],
      \ 'json': ['jq']
      \ }

let s:ale_fixers = {
      \ 'cpp': ['clang-format', 'uncrustify', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'vue': ['vls', 'trim_whitespace', 'remove_trailing_lines'],
      \ 'json': ['jq', 'trim_whitespace', 'remove_trailing_lines'],
      \ 'elixir': [ 'mix_format', 'trim_whitespace', 'remove_trailing_lines'],
      \ 'typescript': ['tslint', 'trim_whitespace', 'remove_trailing_lines'],
      \ 'ruby': ['rubocop', 'trim_whitespace', 'remove_trailing_lines' ],
      \ 'python': ['autopep8', 'add_blank_lines_for_python_control_statements', 'isort', 'yapf', 'trim_whitespace', 'remove_trailing_lines']
      \}

if !exists('g:ale_linters')
  let g:ale_linters = s:ale_linters
else
  call extend(g:ale_linters, s:ale_linters)
endif

if !exists('g:ale_fixers')
  let g:ale_fixers = s:ale_fixers
else
  call extend(g:ale_fixers, s:ale_fixers)
endif

" 2}}}
"
" {{{2 vim-test
let g:test#custom_transformations = {
      \ 'vagrant': function('<SID>VagrantTransform'),
      \ 'docker': function('<SID>DockerTransform'),
      \ 'docker-compose': function('<SID>DockerComposeTransform')
      \}
let g:test#preserve_screen = 1
let g:test#strategy = 'dispatch'
" 2}}}
"
" {{{2 tagbar
let g:tagbar_type_elixir = {
      \ 'ctagstype' : 'elixir',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'functions:functions',
      \ 'c:callbacks',
      \ 'd:delegates',
      \ 'e:exceptions',
      \ 'i:implementations',
      \ 'a:macros',
      \ 'o:operators',
      \ 'm:modules',
      \ 'p:protocols',
      \ 'r:records',
      \ 't:tests'
      \ ]
      \ }
let g:tagbar_type_css = {
      \ 'ctagstype' : 'Css',
      \ 'kinds'     : [
      \ 'c:classes',
      \ 's:selectors',
      \ 'i:identities'
      \ ]
      \ }
let g:tagbar_type_ruby = {
      \ 'kinds'      : ['m:modules',
      \ 'c:classes',
      \ 'C:constants',
      \ 'F:singleton methods',
      \ 'f:methods',
      \ 'a:aliases'],
      \ 'kind2scope' : { 'c' : 'class',
      \ 'm' : 'class' },
      \ 'scope2kind' : { 'class' : 'c' },
      \ 'ctagsbin'   : vimrc_root . '/bin/ripper-tags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
let g:tagbar_type_javascript = {
      \ 'ctagsbin'   : vimrc_root . '/node_modules/.bin/jsctags',
      \ 'ctagsargs'  : ['-f', '-']
      \ }
let g:tagbar_type_ansible = {
      \ 'ctagstype' : 'ansible',
      \ 'kinds' : [
      \ 't:tasks'
      \ ],
      \ 'sort' : 0
      \ }
let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }
let g:tagbar_type_typescript = {
      \ 'ctagsbin' : vimrc_root . '/node_modules/.bin/tstags',
      \ 'ctagsargs' : '-f-',
      \ 'kinds': [
      \ 'e:enums:0:1',
      \ 'f:function:0:1',
      \ 't:typealias:0:1',
      \ 'M:Module:0:1',
      \ 'I:import:0:1',
      \ 'i:interface:0:1',
      \ 'C:class:0:1',
      \ 'm:method:0:1',
      \ 'p:property:0:1',
      \ 'v:variable:0:1',
      \ 'c:const:0:1',
      \ ],
      \ 'sort' : 0
      \ }
" 2}}}
"
" {{{2 gutentags
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = vimrc_root . '/tags'
let g:gutentags_ctags_executable_ruby = g:tagbar_type_ruby['ctagsbin']
let g:gutentags_ctags_executable_javascript = g:tagbar_type_javascript['ctagsbin']
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ '.hg': 'hg files',
      \ },
      \ }
" 2}}}
"
" {{{2 fzf
let g:fzf_buffers_jump = 1
let g:fzf_history_dir = expand('$HOME/.config/nvim/fzf-history')
let g:fzf_gitignore_map = '<Leader>sgi'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header': ['fg', 'Comment']
      \ }
" 2}}}
"
" {{{2 ncm2
let g:ncm2#matcher = 'substrfuzzy'
let g:ncm2#sorter = 'abbrfuzzy'
let g:ncm2#popup_delay = 10
" }}}
"
" {{{ Terminus
let g:TerminusInsertCursorShape = 2
let g:TerminusNormalCursorShape = 1
let g:TerminusReplaceCursorShape = 0 
" }}}
"
" {{{2 ultisnips
let g:UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger  = '<c-k>'
" 2}}}
"
" {{{2 jedi
let g:jedi#goto_assignments_command = '<leader>jg'
let g:jedi#goto_definitions_command = '<leader>jd'
let g:jedi#usages_command = '<leader>jn'
let g:jedi#rename_command = '<leader>jr'
let g:jedi#smart_auto_mappings = 0
let g:jedi#force_py_version = 'auto'
" 2}}}
let g:rooter_use_lcd = 1
" {{{2 orgmode
let g:org_aggressive_conceal = 1
let g:org_todo_keyword_faces = ['bold', 'inverse']
let g:org_indent = 1
let g:org_todo_keywords = [['TODO(t)', 'ACTIVE(a)', '|', 'DONE(d)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]
" 2}}}
" {{{2 startify
let g:startify_list_order = ['commands', 'sessions', 'bookmarks', 'files', 'dir']
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1

function! s:list_commits()
  let git = 'git -C ~/.homesick/repos/vimrc'
  let commits = systemlist(git .' log --oneline | head -n10')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_lists = [
      \ { 'header': ['   Sessions'],       'type': 'sessions' },
      \ { 'header': ['   MRU'],            'type': 'files' },
      \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
      \ { 'header': ['   Commits'],        'type': function('s:list_commits') },
      \ ]
let g:startify_session_before_save = [
      \ 'silent! s:terminal_kill_extra_buffers()'
      \ ]
" 2}}}
"
" {{{2 localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1
let g:localvimrc_persistent_file = expand('$HOME/.config/nvim/localvimrc_persistent')
let g:localvimrc_whitelist = [expand('$HOME/.lvimrc')]
" 2}}}
"
" {{{2 airline
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_extensions = ['branch', 'tabline', 'ale', 'branch', 'tagbar', 'hunks', 'cursormode']
let g:airline_highlighting_cache = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#displyed_head_limit = 30
let g:airline#extensions#branch#format = 2
let g:airline#extensions#disable_rtp_load = 0
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#quickfix#location_text = 'L'
let g:airline#extensions#quickfix#location_text = 'loc'
let g:airline#extensions#quickfix#quickfix_text = 'Q'
let g:airline#extensions#quickfix#quickfix_text = 'qfx'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
" 2}}}
let g:python_highlight_all = 1
let g:notes_suffix = '.md'
let g:goyo_width = '100'
let g:goyo_height = '75%'
" }}}

" {{{ Mappings
let s:mappings = {
      \ 'leader':  ',',
      \ 'localLeader':  '\\',
      \ }
exec 'let g:mapleader="' . s:mappings.leader . '"'
exec 'let g:maplocalleader="' . s:mappings.localLeader. '"'

nnoremap <silent> <CR><CR> :source $MYVIMRC<CR>

call <SID>apply_bulk_mappings([
      \ ['m', ':Make<space>'],
      \ ['a', ':Make all<CR>'],
      \ ['c', ':Make clean<CR>'],
      \ ['i', ':Make install<CR>'],
      \ ['t', ':Make test<CR>'],
      \ ['tb', ":call('Make',['test',expand('%')])<CR>"],
      \ ['u', ':Make uninstall<CR>'],
      \ ], { 'prefix' : 'm' })

call <SID>apply_bulk_mappings([
      \ ['t', ':TestNearest<CR>'],
      \ ['f', ':TestFile<CR>'],
      \ ['a', ':TestSuite<CR>'],
      \ ['l', ':TestLast<CR>'],
      \ ['v', ':TestVisit<CR>'],
      \ ], { 'prefix' : 't' })

call <SID>apply_bulk_mappings([
      \ ['b', ':Buffers<cr>'],
      \ ['c', ':Commits<cr>'],
      \ ['f', ':Files<cr>'],
      \ ['fg', ':GFiles?<cr>'],
      \ ['h', ':History<cr>'],
      \ ['H', ':Helptags<cr>'],
      \ ['mc', ':call fzf#vim#maps("c", 1)<cr>'],
      \ ['mi', ':call fzf#vim#maps("i", 1)<cr>'],
      \ ['mn', ':call fzf#vim#maps("n", 1)<cr>'],
      \ ['mt', ':call fzf#vim#maps("t", 1)<cr>'],
      \ ['mv', ':call fzf#vim#maps("v", 1)<cr>'],
      \ ['s', ':Snippets<cr>'],
      \ ['t', ':Tags<cr>'],
      \ ['w', ':Windows<cr>'],
      \ ], { 'prefix': 's' })

call <SID>apply_bulk_mappings([
      \ ['C', ':Gcommit --branch --verbose %<CR>'],
      \ ['P', ':Gpush<CR>'],
      \ ['b', ':Gbrowse<CR>'],
      \ ['c', ':Gcommit<CR>'],
      \ ['cO', ':Git checkout HEAD -- %<CR>'],
      \ ['co', ':Git checkout<space>'],
      \ ['e', ':Extradite<CR>'],
      \ ['f', ':Git fetch<space>'],
      \ ['fa', ':Git fetch --all<CR>'],
      \ ['l', ':Gpull<CR>'],
      \ ['m', ':MerginalToggle<CR>'],
      \ ['p', ':Gpush<space>'],
      \ ['rm', ':Gremove %<CR>'],
      \ ['rmc', ':Gremove --cached %<CR>'],
      \ ['S', ':Gstatus<CR>'],
      \ ['sd', ':SignifyDebug<CR>'],
      \ ['sh', ':SignifyToggleHighlight<CR>'],
      \ ['sj', '<plug>(signify-next-hunk)'],
      \ ['sk', '<plug>(signify-prev-hunk)'],
      \ ['sr', ':SignifyRefresh<CR>'],
      \ ['st', ':SignifyToggle<CR>'],
      \ ], { 'prefix': 'g' })

call <SID>apply_bulk_mappings([
      \ ['n', '<Plug>(ale_next_wrap)'],
      \ ['p', '<Plug>(ale_previous_wrap)'],
      \ ['f', '<Plug>(ale_first)'],
      \ ['l', '<Plug>(ale_last)'],
      \ ['n', '<Plug>(ale_lint)'],
      \ ['x', '<Plug>(ale_fix)'],
      \ ['r', '<Plug>(ale_reset)'],
      \ ], { 'prefix': 'a'})

call <SID>apply_bulk_mappings([
      \ ['e', '<ESC>:cnext<CR>'],
      \ ['f', '<ESC>:cfirst<CR>'],
      \ ['l', '<ESC>:clast<CR>'],
      \ ['o', '<ESC>:Copen<CR>'],
      \ ['p', '<ESC>:cprevious<CR>'],
      \ ['x', '<ESC>:cclose<CR>'],
      \ ['X', '<ESC>:windo cclose<CR>'],
      \ ], { 'prefix': 'c' })

call <SID>apply_bulk_mappings([
      \ ['e', '<ESC>:lnext<CR>'],
      \ ['f', '<ESC>:lfirst<CR>'],
      \ ['l', '<ESC>:llast<CR>'],
      \ ['o', '<ESC>:lwindow<CR>'],
      \ ['p', '<ESC>:lprevious<CR>'],
      \ ['x', '<ESC>:lclose<CR>'],
      \ ['X', '<ESC>:windo lclose<CR>'],
      \ ], { 'prefix': 'l' })

inoremap <c-c> <ESC>

tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

cnoremap vhe vert help

nnoremap <F8> :TagbarToggle<CR>
nnoremap <silent> <leader><space> :Goyo<CR>

inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>
inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>

" }}}

command! Today call <SID>LaunchNoteOfTheDay()

source ~/.vimrc_background

filetype plugin indent on
syntax on

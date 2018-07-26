" File:          init.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Entry point of all of my configuration.
" Last Modified: August 08, 2017
" vim: set fdm=marker foldlevel=0 :

set encoding=utf-8 fileencoding=utf-8
scriptencoding utf-8

let vimrc_root = fnamemodify($MYVIMRC, ':p:h')

" Visual Editor Components {{{
set laststatus=2
set ruler number numberwidth=6 relativenumber
set guicursor=
set cursorline nocursorcolumn
set sidescrolloff=1 sidescroll=1
set conceallevel=2 concealcursor=nivc
set nowrap
set signcolumn=yes
set shortmess+=c
set hidden
set pumheight=5
set noshowmode noshowmatch
set modeline modelines=10
set lazyredraw
set spelllang=en_us
set noshowcmd

if has("termguicolors") " set true colors
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif

"
" Folding {{{
set foldenable
set foldcolumn=2
set foldlevel=1
set foldmethod=syntax
" }}}
" }}}
"
" White spacing and Characters {{{
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

set regexpengine=1

set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\

"}}}
"
" Debugging help {{{
" This makes it easier for me to capture logging output from Vim.
if exists('$DEBUG')
  set verbose=3
  let &verbosefile=expand('$HOME/.config/nvim/logs/runtime.log')
  let $NVIM_PYTHON_LOG_FILE=expand("$HOME/.config/nvim/logs/python.log")
endif
" }}}
"
" Undo, Backup, Swap {{{
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
set undoreload=1000

set backup writebackup
set backupdir=~/.config/nvim/backup

set noswapfile
" }}}
"
" Spacing {{{
set tabstop=2 softtabstop=2
set shiftwidth=2 textwidth=80
set smarttab expandtab
set shiftround
" }}}
"
" Searching {{{
set ignorecase smartcase
set laststatus=2 cmdheight=2
set incsearch hlsearch
" }}}
"
" Tags {{{
" Find tags in local directory.
set tags+=./tags,./.tags,./.vimtags
set tags+=tags,.tags,.vimtags

" Import globally built tags.
set tags+=$HOME/.config/nvim/tags/*

" Disable cscope.
set nocscopetag
" }}}
"
iabbrev me_email yo@jacky.wtf
iabbrev me_name Jacky Alciné
iabbrev me_fname Jacky
iabbrev me_lname Alciné
iabbrev me_site https://jacky.wtf
"
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
" Plugins {{{
filetype off

" {{{{ Definition
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
Plug 'direnv/direnv.vim'
Plug 'w0rp/ale'
Plug 'wincent/terminus'

Plug 'tpope/vim-commentary'
      \ | Plug 'cbaumhardt/vim-commentary-boxed'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-shell'
Plug 'vim-scripts/utl.vim'
Plug 'bpstahlman/txtfmt'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fubitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'idanarye/vim-merginal'
Plug 'mattn/gist-vim'
Plug 'nkantar/ght.vim'
Plug 'int3/vim-extradite'
" TODO: I need to learn how to use these plugins.
" Plug 'junkblocker/patchreview-vim'
" Plug 'codegram/vim-codereview'

Plug 'MattesGroeger/vim-bookmarks'
Plug 'chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'gabrielelana/vim-markdown'
Plug 'jceb/vim-orgmode'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
      \ | Plug 'junegunn/fzf.vim'
      \ | Plug 'fszymanski/fzf-gitignore', { 'do' : ':UpdateRemotePlugins' }
      \ | Plug 'tweekmonster/fzf-filemru'

Plug 'chriskempson/base16-vim'
Plug 'keith/investigate.vim'
Plug 'vim-airline/vim-airline' |
      \ Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-dispatch' |
      \ Plug 'radenling/vim-dispatch-neovim'

Plug 'tmux-plugins/vim-tmux'
      \ | Plug 'tmux-plugins/vim-tmux-focus-events'
      \ | Plug 'MikeDacre/tmux-zsh-vim-titles'

" NOTE: Used only with notes.
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'zhm/TagHighlight'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-rooter'
Plug 'raimondi/delimitmate'
Plug 'godlygeek/tabular'
Plug 'tweekmonster/startuptime.vim'
Plug 'wakatime/vim-wakatime'

Plug 'sheerun/vim-polyglot'
Plug 'lambdalisue/vim-pyenv', { 'for': 'python' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'tweekmonster/braceless.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'cquery-project/cquery', { 'for': 'c,c++',
      \ 'do': 'mkdir -p build && cd build && cmake .. && make' }
Plug 'gorodinskiy/vim-coloresque'

Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'

" {{{{{ IDE-esque
Plug 'vim-scripts/dbext.vim'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-utlisnips'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'terryma/vim-multiple-cursors'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'othree/csscomplete.vim', {'for': 'css'}
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
Plug 'awetzel/elixir.nvim', {
      \ 'do': 'yes \| ./install.sh',
      \ 'for': 'elixir'
      \ }
Plug 'JakeBecker/elixir-ls', {
      \ 'do' : 'mix do deps.get, deps.compile, compile, elixir_ls.release -o ' . vimrc_root . '/bin',
      \ }
Plug 'sourcegraph/javascript-typescript-langserver', {
      \ 'do': 'ndenv exec npm install && npm run build',
      \ }
Plug 'roxma/LanguageServer-php-neovim',  {
      \ 'do': 'phpenv exec composer install && composer run-script parse-stubs'
      \ }
" }}}}}

Plug 'sirver/ultisnips'
      \ |  Plug 'honza/vim-snippets'

Plug 'roxma/vim-tmux-clipboard'

Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}}}

" {{{{ Options

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
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = vimrc_root . "/tags"
let g:gutentags_ctags_executable_ruby = g:tagbar_type_ruby['ctagsbin']
let g:gutentags_ctags_executable_javascript = g:tagbar_type_javascript['ctagsbin']
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ '.hg': 'hg files',
      \ },
      \ }

" endwise
let g:endwise_no_mappings = 1
" fzf {{{
let g:fzf_buffers_jump = 1
let g:fzf_history_dir = expand('$HOME/.config/nvim/fzf-history')
let g:fzf_gitignore_map = '<Leader>sgi'
let g:fzf_layout = { 'down': '~10%' }
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
" }}}
"
" {{{ echodoc
let g:echodoc#enable_at_startup = 1
" }}}
"
" ultisnips {{{
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
" }}}
"
" test {{{
let g:test#preserve_screen = 1
let g:test#strategy = {
      \ 'nearest': 'neovim'
      \ }
" }}}
"
" languageclient {{{
let g:LanguageClient_autoStart = 1
" let g:LanguageClient_selectionUI = 'fzf'
" }}}
"
" signify {{{
let g:signify_vcs_list              = [ 'git', 'bzr' ]
let g:signify_cursorhold_insert     = 0
let g:signify_cursorhold_normal     = 1
let g:signify_update_on_bufenter    = 1
let g:signify_update_on_focusgained = 1
let g:signify_realtime = 1
let g:signify_sign_add = '∙'
let g:signify_sign_delete = '∙'
let g:signify_sign_delete_first_line = '∙'
let g:signify_sign_change = '∙'
let g:signify_sign_changedelete = '∙'
" }}}
"
" jedi {{{
let g:jedi#popup_on_dot = 0
let g:jedi#documentation_command = 'K'
let g:jedi#goto_assignments_command = '<leader>jg'
let g:jedi#goto_definitions_command = '<leader>jd'
let g:jedi#usages_command = '<leader>jn'
let g:jedi#rename_command = '<leader>jr'
let g:jedi#show_call_signatures = '1'
let g:jedi#completions_command = '<C-Space>'
let g:jedi#smart_auto_mappings = 0

" }}}
"
" pyenv {{{
let g:pyenv#auto_activate = 0
let g:pyenv#auto_create_ctags = 0
let g:pyenv#auto_assign_ctags = 0
" }}}
"
" rooter {{{
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1
let g:rooter_change_directory_for_non_project_files = 'home'
" }}}
"
" ncm {{{
let g:cm_multi_threading = 1
let g:cm_matcher = {
      \ 'module': 'cm_matchers.abbrev_matcher',
      \ 'case': 'smartcase'
      \ }
let g:cm_completekeys = "\<Plug>(cm_completefunc)"

if exists('$NVIM_VERBOSE')
  let $NVIM_NCM_LOG_LEVEL='DEBUG'
  let $NVIM_NCM_MULTI_THREAD=0
endif
" }}}
"
" {{{ investigate.vim
let g:investigate_use_dash = 1
let g:investigate_use_dash_for_vim = 1
let g:investigate_syntax_for_dockerfile = 'docker'
" }}}

" {{{ orgmode
let g:org_aggressive_conceal = 1
let g:org_todo_keyword_faces = ["bold", "inverse"]
let g:org_indent = 1
let g:org_todo_keywords = [['TODO(t)', 'ACTIVE(a)', '|', 'DONE(d)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]
" }}}
"
" ale {{{
let g:ale_use_global_executables = 0
let g:ale_scss_stylelint_executable = vimrc_root . "/node_modules/.bin/stylelint"
let g:ale_fixers = {
      \ 'css': [
      \   'stylelint',
      \ ],
      \ 'elixir': [
      \   'mix_format'
      \ ],
      \ 'scss': [
      \   'stylelint',
      \ ],
      \ 'javascript': [
      \   'eslint',
      \ ],
      \ 'typescript': [
      \   'tslint',
      \ ],
      \ 'json': [
      \   'jq'
      \ ],
      \ 'python': [
      \   'isort',
      \   'autopep8',
      \   'add_blank_lines_for_python_control_statements'
      \ ]
      \ }
let g:ale_linters = {
      \ 'vue': [
      \   'vls',
      \ ],
      \ 'typescript': [
      \   'tslint',
      \ ]
      \}
let g:ale_fixers['vue'] = g:ale_fixers['javascript']
let g:ale_fixers['sass'] = g:ale_fixers['scss']
" }}}
"
" investigate {{{
let g:investigate_command_for_elixir = '/usr/bin/zeal ^s'
" }}}
"
" {{{ vim-test
let g:test#strategy = 'dispatch'
" }}}
"
" github-dashboard {{{
let g:github_dashboard = {
      \ 'position': 'top',
      \ 'emoji': 1
      \ }
" }}}
"
" merginal {{{
let g:merginal_windowSize = 35
" }}}
"
" startify {{{
let g:startify_list_order = ['commands', 'sessions', 'bookmarks', 'files']
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1
let g:startify_session_before_save = [
      \ 'silent! s:terminal_kill_extra_buffers()'
      \ ]
" }}}
"
" {{ localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1
let g:localvimrc_persistent_file = expand('$HOME/.config/nvim/localvimrc_persistent')
let g:localvimrc_whitelist = [expand('$HOME/.lvimrc')]
" }}
"
" {{ airline
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'tabline', 'ale', 'branch', 'tagbar', 'hunks', 'gutentags', 'cursormode']
let g:airline#extensions#quickfix#quickfix_text = 'Q'
let g:airline#extensions#quickfix#location_text = 'L'
let g:airline#extensions#branch#displyed_head_limit = 15
let g:airline#extensions#branch#format = 2
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

" }}
"
let g:python_highlight_all = 1
let g:notes_suffix = '.txt'
let g:goyo_width = '100'
let g:goyo_height = '75%'

" {{{ language-specific
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
" }}}
" }}}}
"
filetype plugin indent on
syntax on
" }}}
"
" {{{ Mappings
let s:mappings = {
      \ 'leader':  ',',
      \ 'localLeader':  '\\',
      \ }

" make {{{
" Binds the command used for running 'Make'.
call <SID>apply_bulk_mappings([
      \ ['m', ':Make<space>'],
      \ ['a', ':Make all<CR>'],
      \ ['c', ':Make clean<CR>'],
      \ ['i', ':Make install<CR>'],
      \ ['t', ':Make test<CR>'],
      \ ['tb', ":call('Make',['test',expand('%')])<CR>"],
      \ ['u', ':Make uninstall<CR>'],
      \ ], { 'prefix' : 'm' })
" }}}
"
" test {{{
" Binds the command used for running tests.
call <SID>apply_bulk_mappings([
      \ ['t', ':TestNearest<CR>'],
      \ ['f', ':TestFile<CR>'],
      \ ['a', ':TestSuite<CR>'],
      \ ['l', ':TestLast<CR>'],
      \ ['g', ':TestVisit<CR>'],
      \ ], { 'prefix' : 't' })
" }}}
"
" fzf {{{
" Binds commands for using the fuzzy finder.
call <SID>apply_bulk_mappings([
      \ ['f', ':Files<cr>'],
      \ ['fg', ':GFiles?<cr>'],
      \ ['t', ':Tags<cr>'],
      \ ['h', ':History<cr>'],
      \ ['w', ':Windows<cr>'],
      \ ['c', ':Commits<cr>'],
      \ ['b', ':Buffers<cr>'],
      \ ['s', ':Snippets<cr>'],
      \ ['mi', ':call fzf#vim#maps("i", 1)<cr>'],
      \ ['mn', ':call fzf#vim#maps("n", 1)<cr>'],
      \ ['mv', ':call fzf#vim#maps("v", 1)<cr>'],
      \ ['mc', ':call fzf#vim#maps("c", 1)<cr>'],
      \ ['mt', ':call fzf#vim#maps("t", 1)<cr>'],
      \ ], { 'prefix': 's' })
" }}}
"
" git {{{
" Binds commands for using Git-related commands.
call <SID>apply_bulk_mappings([
      \ ['a', ':Git add<space>'],
      \ ['ab', ':Git add %<cr>'],
      \ ['b', ':Gbrowse<CR>'],
      \ ['b', ':Gbrowse<CR>'],
      \ ['c', ':Gcommit<CR>'],
      \ ['C', ':Gcommit --branch --verbose %<CR>'],
      \ ['co', ':Git checkout<space>'],
      \ ['cO', ':Git checkout HEAD -- %<CR>'],
      \ ['f', ':Git fetch<space>'],
      \ ['fa', ':Git fetch --all<CR>'],
      \ ['p', ':Git push<space>'],
      \ ['P', ':Git push<CR>'],
      \ ['rm', ':Gremove %<CR>'],
      \ ['rmc', ':Git rm --cached %<CR>'],
      \ ['l', ':Commits<CR>'],
      \ ['m', ':MerginalToggle<CR>'],
      \ ['st', ':SignifyToggle<CR>'],
      \ ['sh', ':SignifyToggleHighlight<CR>'],
      \ ['sr', ':SignifyRefresh<CR>'],
      \ ['sd', ':SignifyDebug<CR>'],
      \ ['sj', '<plug>(signify-next-hunk)'],
      \ ['sk', '<plug>(signify-prev-hunk)'],
      \ ], { 'prefix': 'g' })
" }}}
"
" {{{ Tabularize
call <SID>apply_bulk_mappings([
      \ ['=', ':Tabularize /=', 'v'],
      \ ['/', ':Tabularize //', 'v'],
      \ [':', ':Tabularize /:', 'v'],
      \ [',', ':Tabularize /,', 'v'],
      \ [']', ':Tabularize /]', 'v'],
      \ ['[', ':Tabularize /[', 'v']
      \ ], { 'prefix': 'T'})
" }}}
"
" {{{ ale
call <SID>apply_bulk_mappings([
      \ ['n', '<Plug>(ale_next_wrap)'],
      \ ['p', '<Plug>(ale_previous_wrap)'],
      \ ['f', '<Plug>(ale_first)'],
      \ ['l', '<Plug>(ale_last)'],
      \ ['n', '<Plug>(ale_lint)'],
      \ ['x', '<Plug>(ale_fix)'],
      \ ['r', '<Plug>(ale_reset)'],
      \ ], { 'prefix': 'a'})
" }}}
"
" ncm {{{
" Expand a snippet when shown in the list.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : (!empty(v:completed_item) ? ncm2_ultisnips#expand_or("", 'n') : "\<CR>" ))
smap <c-u> <Plug>(ultisnips_expand)
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
" }}}
"
" {{{ LanguageClient
nnoremap <silent> gK :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
" }}}

" }}}

" Mappings {{{
" Define the leader!
exec 'let g:mapleader="' . s:mappings.leader . '"'
exec 'let g:maplocalleader="' . s:mappings.localLeader. '"'
"
" Ensure that InsertLeave is triggered.
inoremap <c-c> <ESC>
"
" {{{{ Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" }}}}
"
" Rewrite 'vhe' to 'vert help'.
cnoremap vhe vert help
"
" Show me tags.
nnoremap <F8> :TagbarToggle<CR>
"
" Focuses Vim.
nnoremap <silent> <leader><space> :Goyo<CR>
"
" Time & Date Values {{{
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>
"
" Inject the current time with the labeling of the time-zone.
inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>
"
" Inject the current date and time (in Insert or Command mode).
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>
"
" Inject the current date in Insert or Command mode).
inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
" }}}}
"
" {{{{ Bulk Mappings
" quickfix
call <SID>apply_bulk_mappings([
      \ ['e', '<ESC>:cnext<CR>'],
      \ ['f', '<ESC>:cfirst<CR>'],
      \ ['l', '<ESC>:clast<CR>'],
      \ ['o', '<ESC>:Copen<CR>'],
      \ ['p', '<ESC>:cprevious<CR>'],
      \ ['x', '<ESC>:cclose<CR>'],
      \ ['X', '<ESC>:windo cclose<CR>'],
      \ ], { 'prefix': 'c' })
"
" loclist
call <SID>apply_bulk_mappings([
      \ ['e', '<ESC>:lnext<CR>'],
      \ ['f', '<ESC>:lfirst<CR>'],
      \ ['l', '<ESC>:llast<CR>'],
      \ ['o', '<ESC>:lwindow<CR>'],
      \ ['p', '<ESC>:lprevious<CR>'],
      \ ['x', '<ESC>:lclose<CR>'],
      \ ['X', '<ESC>:windo lclose<CR>'],
      \ ], { 'prefix': 'l' })
" }}}}
" }}}
"
" Functions {{{
func! s:enhance_prose() abort
  let l:is_in_text = (&ft == 'text')
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
  map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
  map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight
  nmap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  xmap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
  imap <silent> <buffer> <F8> <C-o>:NextWordy<cr>
  nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off
  vmap <leader>d <Plug>Ditto         " Call Ditto on visual selection
  nmap <leader>d <Plug>Ditto         " Call Ditto on operator movement
  nmap =d <Plug>DittoNext                " Jump to the next word
  nmap -d <Plug>DittoPrev                " Jump to the previous word
  nmap +d <Plug>DittoGood                " Ignore the word under the cursor
  nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
  nmap ]d <Plug>DittoMore                " Show the next matches
  nmap [d <Plug>DittoLess                " Show the previous matches
endfunc
" }}}

source ~/.vimrc_background
call Base16hi("MatchParen", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold,italic", "")
" AirlineTheme base16_default

func! s:adapt_terminal() abort
  setl noruler nocursorcolumn nocursorline norelativenumber nonumber
  setl signcolumn=no foldcolumn=0
endfunc

func! s:terminal_kill_extra_buffers() abort
  silent! TagbarClose
  silent! MerginalClose
  silent! cclose
  silent! lclose
  silent! bd Merginal:branchList
endfunc

func! s:terminal_update_colors() abort
  " :h term-dependent-settings
  if &term =~ '^\(rxvt\|interix\|putty\)\(-.*\)\?$'
    set notermguicolors
  elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
    set termguicolors
  elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
    if $XTERM_VERSION != ''
      set termguicolors
    elseif $KONSOLE_PROFILE_NAME != ''
      set termguicolors
    elseif $VTE_VERSION != ''
      set termguicolors
    else
      echo "woop"
      set notermguicolors
    endif
  endif

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endfunc

function! s:VagrantTransform(cmd) abort
  let l:vagrant_project = get(matchlist(join(readfile('Vagrantfile'), '\n'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  return 'vagrant ssh --command '.shellescape('cd ' . l:vagrant_project . '; '.a:cmd)
endfunction

function! s:DockerTransform(cmd) abort
  return 'docker run ' . g:test_docker_container . ' '.shellescape(a:cmd)
endfunction

function! s:DockerComposeTransform(cmd) abort
  return 'docker-compose run ' . b:test_docker_compose_service . ' '.shellescape(a:cmd)
endfunction

let g:test#custom_transformations = {
    \ 'vagrant': function('<SID>VagrantTransform'),
    \ 'docker': function('<SID>DockerTransform'),
    \ 'docker-compose': function('<SID>DockerComposeTransform')
    \}

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

augroup vimrc_misc
  au!
  au BufEnter         * :syntax sync maxlines=200
  au User Startified    :call s:adapt_terminal()
augroup END

augroup vimrc_auto_tmux_reload
  au!
  au FileWritePost ~/.tmux* !tmux source-file %:h
augroup END

augroup vimrc_term
  au!
  au TermOpen *        call s:adapt_terminal()
  au BufEnter term://* startinsert
  au BufLeave term://* stopinsert
augroup END

augroup vimrc-langsupport
  au!
  au FileType *                    nested call s:langclient_start_for_ft("<amatch>")
  au FileType python               nested call jalcine#lang#python#tweak()
  au FileType php                  nested call jalcine#lang#php#tweak()
  au FileType css                  nested setl omnifunc=csscomplete#CompleteCSS noci
  au FileType markdown,mkd,txtfmt  nested call jalcine#prose#enhance()
  au FileType yaml,python          nested BracelessEnable +indent +fold +highlight
  au FileType man                  nested setlocal conceallevel=0
  au FileType quickfix,loclist     nested call s:adapt_terminal()
augroup END

augroup vimrc_goyo
  au!
  au User GoyoEnter nested call s:goyo_enter()
  au User GoyoLeave nested call s:goyo_leave()
augroup END

augroup vimrc_init
  au!
  au VimEnter * Startify
augroup END

command! Today call <SID>LaunchNoteOfTheDay()

func! s:LaunchNoteOfTheDay() abort
  execute ':Note Morning Entries/' . strftime('%Y-%m-%d')
  Goyo
endfunc

call <SID>apply_bulk_mappings([
      \ ['e', 'call s:php_invoke("expandclass")<CR>'],
      \ ['s', 'call s:php_invoke("sortuse")<CR>'],
      \ ['u', 'call s:php_invoke("insertuse")<CR>'],
      \ ], {
      \ 'prefix': 'ph'
      \ })

func! s:php_invoke(cmd) abort
  if     a:cmd ==# 'sortuse' | call PhpInsertUse()
  elseif a:cmd ==# 'expandclass' | call PhpExpandClass()
  elseif a:cmd ==# 'insertuse' | call PhpInsertUse()
  endif
endfunc

let g:ale_php_phpcs_executable = 'phpenv exec composer global exec phpcs'
let g:ale_php_phpcbf_executable = 'phpenv exec composer global exec phpcbf'

if exists('g:ale_fixers')
  let g:ale_fixers['php'] = ['php_cs_fixer', 'phpcbf']
endif

function! s:jedi_auto_force_py_version() abort
  call jedi#force_py_version(pyenv#python#get_internal_major_version())
endfunction

augroup vim-pyenv-custom-augroup
  autocmd! *
  autocmd User vim-pyenv-activate-post   call <SID>jedi_auto_force_py_version()
  autocmd User vim-pyenv-deactivate-post call <SID>jedi_auto_force_py_version()
augroup END

let g:python_highlight_all = 1
let g:python_slow_sync = 1
let g:python3_host_prog = systemlist('PYENV_VERSION=neovim-py3 pyenv which python3')[0]
let g:python_host_prog = systemlist('PYENV_VERSION=neovim-py2 pyenv which python2')[0]

func! s:langclient_start_for_ft(ft) abort
  if has_key(g:LanguageClient_serverCommands, a:ft) == 1
    LanguageClientStart
    setl completefunc=LanguageClient#complete
    setl formatexpr=LanguageClient_textDocument_rangeFormatting()
  else
    set formatexpr&vim
  endif
endfunc

let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': [ 'neovim-language-server-javascript' ],
      \ 'python': ['pyenv', 'exec', 'pyls'],
      \ 'go': ['goenv', 'exec', 'go-langserver'],
      \ 'php': ['neovim-language-server-php'],
      \ 'ruby': [ vimrc_root . '/bin/language_server-ruby' ],
      \ 'elixir': [ vimrc_root . '/bin/language_server.sh'],
      \ 'css': [ 'css-language-server', '--stdio' ],
      \ 'cpp': [ 'cquery', '--log-file=/tmp/cq.log' ],
      \ 'sh': [ vimrc_root . '/node_modules/.bin/bash-language-server', 'start'],
      \ 'vue': [ vimrc_root . '/node_modules/.bin/vls' ]
      \ }

if exists('$DEBUG')
  let g:LanguageClient_trace = "verbose"
  let g:LanguageClient_windowLogMessageLevel = "Log"
  let g:LanguageClient_serverCommands.javascript += ['--trace', '--logfile', vimrc_root . '/logs/lsp-javascript.log' ]
  let g:LanguageClient_serverCommands.python += ['--log-file', vimrc_root . '/logs/lsp-python.log' ]
  let g:LanguageClient_serverCommands.go += ['-logfile', vimrc_root . '/logs/lsp-go.log' ]
endif

if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

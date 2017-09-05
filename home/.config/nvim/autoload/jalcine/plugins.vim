" File:          jalcine/plugins.vim
" Description:   Setup the plugins I'll be using.
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: August 24, 2017
" vim: set fdm=marker :
scriptencoding utf-8

" Options {{{
let g:jalcine.plugins = {
      \ 'root': expand('$HOME/.config/nvim/plugins'),
      \ }
" }}}

func! jalcine#plugins#setup() abort " {{{
  call jalcine#plugins#define()
  call jalcine#plugins#configure()
  call jalcine#plugins#configure_mappings()

  filetype plugin indent on
  syntax on

  if exists('$NVIM_VERBOSE')
    let $NVIM_PYTHON_LOG_FILE=expand('$HOME/.config/nvim/logs/python.log')
  endif
endfunc " }}}

func! jalcine#plugins#define() abort " {{{
  call plug#begin(g:jalcine.plugins.root)

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'

  Plug 'benekastah/neomake'
  Plug 'janko-m/vim-test'
  Plug 'tpope/vim-dotenv'
        \ | Plug 'direnv/direnv.vim'

  Plug 'tpope/vim-rsi'
        \ | Plug 'vim-utils/vim-husk'

  Plug 'tpope/vim-commentary'
        \ | Plug 'cbaumhardt/vim-commentary-boxed'

  Plug 'xolox/vim-misc'
        \ | Plug 'xolox/vim-notes'
        \ | Plug 'xolox/vim-shell'

  Plug 'tpope/vim-fugitive'
        \ | Plug 'tpope/vim-rhubarb'
        \ | Plug 'tommcdo/vim-fugitive-blame-ext'
        \ | Plug 'idanarye/vim-merginal'
        \ | Plug 'mattn/gist-vim'
        \ | Plug 'nkantar/ght.vim'

  Plug 'editorconfig/editorconfig-vim'
  Plug 'embear/vim-localvimrc'
  Plug 'tpope/vim-scriptease'
  Plug 'thaerkh/vim-workspace'
  Plug 'chiel92/vim-autoformat'
  Plug 'ap/vim-css-color'
  Plug 'gabrielelana/vim-markdown'
  Plug 'mhinz/vim-signify'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'jceb/vim-orgmode'
  Plug 'mattn/emmet-vim'
  Plug 'thaerkh/vim-workspace'
  Plug 'junegunn/gv.vim'
  Plug 'mattn/webapi-vim'
  Plug 'tpope/vim-abolish'
  Plug 'stanangeloff/php.vim'
  Plug 'moll/vim-node'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        \ | Plug 'junegunn/fzf.vim'
        \ | Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bogado/file-line'
        \ | Plug 'Shougo/echodoc.vim'

  Plug 'tpope/vim-dispatch'
        \ | Plug 'radenling/vim-dispatch-neovim'

  Plug 'tmux-plugins/vim-tmux'
  Plug 'tmux-plugins/vim-tmux-focus-events'

  Plug 'sheerun/vim-polyglot'
        \ | Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
        \ | Plug 'davidhalter/jedi-vim'
        \ | Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
        \ | Plug 'lambdalisue/vim-pyenv'
        \ | Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
        \ | Plug 'fisadev/vim-isort', { 'for': 'python' }
        \ | Plug 'python-rope/ropevim', { 'for': 'python' }
        \ | Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
        \ | Plug 'fatih/vim-go', { 'for': 'go'}
        \ | Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
        \ | Plug 'powerman/vim-plugin-AnsiEsc'
        \ | Plug 'nsf/gocode', { 'run': 'make' },
        \ | Plug 'slashmili/alchemist.vim',

  Plug 'craigemery/vim-autotag'
  Plug 'majutsushi/tagbar'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-surround'
  Plug 'raimondi/delimitmate'


  Plug 'roxma/nvim-completion-manager'
        \ | Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
        \ | Plug 'roxma/nvim-cm-racer'
        \ | Plug 'roxma/ncm-rct-complete'
        \ | Plug 'roxma/ncm-github'
        \ | Plug 'jsfaint/gen_tags.vim'
        \ | Plug 'Shougo/neco-vim'
        \ | Plug 'roxma/clang_complete'
        \ | Plug 'Shougo/neco-syntax'
        \ | Plug 'Shougo/neoinclude.vim'
        \ | Plug 'calebeby/ncm-css'
        \ | Plug 'roxma/nvim-cm-tern', { 'run': 'npm install' }
        \ | Plug 'roxma/ncm-github'
        \ | Plug 'phpactor/phpactor' ,  {'do': 'composer install'}
        \ | Plug 'roxma/ncm-phpactor'
        \ | Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install' }
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

  Plug 'brooth/far.vim'
  Plug 'roxma/vim-tmux-clipboard'
  Plug 'sirver/ultisnips'
        \ | Plug 'honza/vim-snippets'

  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-projectionist'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  Plug 'jalcine/vim-sunset'

  call plug#end()
endfunc " }}}

func! jalcine#plugins#configure() abort " {{{
  " airline {{{
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#prefix = '⤴'
  let g:airline#extensions#hunks#non_zero_only = 1
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#neomake#enabled = 1
  let g:airline#extensions#paste#symbol = 'ρ'
  let g:airline#extensions#readonly#symbol = '⊘'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#tabline#show_splits = 1
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#whitespace#enabled = 1
  let g:airline#extensions#whitespace#mixed_indent_algo = 1
  let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
  let g:airline#extensions#whitespace#show_message = 1
  let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
  let g:airline_detect_iminsert = 1
  let g:airline_detected_modified = 1
  let g:airline_powerline_fonts = 1
  let g:airline_symbols = {}
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.branch = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'B'
        \ }
  " }}}
  "
  " fzf {{{
  " TODO: Add that directory to init construction.
  " TODO: Tell fzf what tag file to use.

  let g:fzf_buffers_jump = 1
  let g:fzf_history_dir = '~/.config/nvim/fzf-history'
  let g:fzf_gitignore_map = '<Leader>sgi'
  let g:fzf_tags_command = 'ctags -A .tags'
  " }}}
  "
  " autotag {{{
  let g:autotagVerbosityLevel = 5
  let g:autotagTagsFile = '.vimtags'
  " }}}
  "
  " neomake {{{
  if exists('$NVIM_VERBOSE')
    let g:neomake_verbose = 3
    let g:neomake_logfile = expand('$HOME/.config/nvim/logs/neomake.log')
  endif

  let g:neomake_list_height = 3
  let g:neomake_open_list = 2
  let g:neomake_serialize = exists('$NVIM_VERBOSE')
  let g:neomake_serialize_abort_on_error = g:neomake_serialize
  let g:neomake_elixir_enabled_makers = ['mix', 'credo']
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy', 'pylint']
  let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
  let g:neomake_scss_enabled_makers = ['scss-lint']
  let g:neomake_sh_enabled_makers = ['shellcheck']
  let g:neomake_vim_enabled_makers = ['vint']
  " }}}
  "
  " tagbar {{{
  let g:tagbar_autofocus = 0
  let g:tagbar_autoshowtag = 0
  let g:tagbar_comact = 1
  " }}}
  "
  " ultisnips {{{
  let g:UltiSnipsExpandTrigger		= '<Plug>(ultisnips_expand)'
  let g:UltiSnipsRemoveSelectModeMappings = 0
  let g:UltiSnipsEditSplit='vertical'
  let g:UltiSnipsNoPythonWarning=1
  " }}}
  "
  " test {{{
  let g:test#preserve_screen = 0
  let g:test#strategy = {
        \ 'nearest': 'neovim',
        \ 'file': 'dispatch',
        \ 'suite': 'neovim',
        \ }
  " }}}
  "
  " languageclient {{{
  let g:LanguageClient_autoStart = 1
  let g:LanguageClient_selectionUI = 'fzf'

  " TODO: Set up language server shit.
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'javascript': [fnamemodify('$MYVIMRC', ':p:h') . '/plugins/javascript-typescript-langserver/lib/language-server-stdio.js']
        \ }
  " }}}
  "
  " jedi {{{
  let g:jedi#popup_on_dot = 1
  let g:jedi#goto_assignments_command = '<leader>jg'
  let g:jedi#goto_definitions_command = '<leader>jd'
  let g:jedi#documentation_command = 'K'
  let g:jedi#usages_command = '<leader>jn'
  let g:jedi#rename_command = '<leader>jr'
  let g:jedi#show_call_signatures = '1'
  let g:jedi#completions_command = '<C-Space>'
  let g:jedi#smart_auto_mappings = 0

  " }}}
  "
  " pyenv {{{
  let g:pyenv#auto_activate = 1
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
  " indentline {{{
  let g:indentLine_showFirstIndentLevel = 0
  let g:indentLine_setColors = 1
  let g:indentLine_leadingSpaceEnabled = 1
  let g:indentLine_fileTypeExclude = ['tagbar', 'help', 'netrw', 'gitcommit', 'startify']
  let g:indentLine_char = '┊'
  " }}}
  "
  " ncm {{{
  let g:cm_matcher = {
        \ 'module': 'cm_matchers.substr_matcher',
        \ 'case': 'smartcase'
        \ }
  if exists('$NVIM_VERBOSE')
    let $NVIM_NCM_LOG_LEVEL='DEBUG'
    let $NVIM_NCM_MULTI_THREAD=0
  endif
  " }}}
  "
  " misc {{{
  " let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
  let g:localvimrc_persistent = 2
  let g:polyglot_disabled = ['python']
  let g:python_highlight_all = 1
  let g:notes_suffix = '.txt'
  " }}}
  "
  " workspace {{{
  let g:workspace_autocreate = 0
  let g:workspace_session_name = '.session.vim'
  let g:workspace_autosave_ignore = ['gitcommit']
  " }}}
endfunc " }}}

func! jalcine#plugins#configure_mappings() abort " {{{
  " make {{{
  " Binds the command used for running 'Make'.
  call jalcine#mappings#apply_bulk([
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
  call jalcine#mappings#apply_bulk([
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
  call jalcine#mappings#apply_bulk([
        \ ['f', ':Files<cr>'],
        \ ['gf', ':GFiles<cr>'],
        \ ['t', ':Tags<cr>'],
        \ ['h', ':History<cr>'],
        \ ['w', ':Windows<cr>'],
        \ ['c', ':Commits<cr>'],
        \ ['b', ':Buffers<cr>'],
        \ ], { 'prefix': 's' })
  " }}}
  "
  " git {{{
  " Binds commands for using Git-related commands.
  call jalcine#mappings#apply_bulk([
        \ ['a', ':Git add<space>'],
        \ ['ab', ':Git add %<cr>'],
        \ ['b', ':Gbrowse<CR>'],
        \ ['b', ':Gbrowse<CR>'],
        \ ['c', ':Git commit<space>'],
        \ ['C', ':Gcommit --branch --verbose %<CR>'],
        \ ['co', ':Git checkout<space>'],
        \ ['f', ':Git fetch<space>'],
        \ ['fa', ':Git fetch --all<CR>'],
        \ ['p', ':Git push<space>'],
        \ ['P', ':Git push<CR>'],
        \ ['rm', ':Gremove %<CR>'],
        \ ['rmc', ':Git rm --cached %<CR>'],
        \ ['l', ':Commits<CR>'],
        \ ['m', ':Merginal<CR>'],
        \ ], { 'prefix': 'g' })
  " }}}
  "
  " ncm {{{
  inoremap <silent> <c-g> <Plug>(cm_force_refresh)
  inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
  " }}}
  "
  " workspace {{{
  call jalcine#mappings#apply_bulk([
        \ ['t', ':ToggleWorkspace<CR>'],
        \ ], { 'prefix': 'w' })
  " }}}
endfunc " }}}

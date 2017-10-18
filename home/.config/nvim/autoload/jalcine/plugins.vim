
" Description:   Setup the plugins I'll be using.
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: August 24, 2017
" vim: set fdm=marker fdl=0 :

scriptencoding utf-8

" Options {{{
let g:jalcine.plugins = {
      \ 'root': expand('$HOME/.config/nvim/plugins'),
      \ }
" }}}

func! jalcine#plugins#setup() abort " {{{
  " Shut off everything for a moment.
  filetype off

  " Lift off.
  call jalcine#plugins#define()
  call jalcine#plugins#configure()
  call jalcine#plugins#configure_mappings()

  " Check everything.
  if exists('$NVIM_VERBOSE')
    let $NVIM_PYTHON_LOG_FILE=expand('$HOME/.config/nvim/logs/python.log')
  endif

  " Go into orbit.
  filetype plugin indent on
  syntax on
endfunc " }}}

func! jalcine#plugins#define() abort " {{{
  call plug#begin(g:jalcine.plugins.root)

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-scriptease'
  Plug 'tpope/vim-rsi'
  Plug 'vim-utils/vim-husk'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'benekastah/neomake'
  Plug 'janko-m/vim-test'
  Plug 'tpope/vim-dotenv'
  Plug 'direnv/direnv.vim'

  Plug 'tpope/vim-commentary'
  Plug 'cbaumhardt/vim-commentary-boxed'

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-shell'
  Plug 'vim-scripts/utl.vim'
  Plug 'bpstahlman/txtfmt'

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tommcdo/vim-fugitive-blame-ext'
  Plug 'idanarye/vim-merginal'
  Plug 'mattn/gist-vim'
  Plug 'nkantar/ght.vim'
  Plug 'junegunn/vim-github-dashboard'

  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'ap/vim-css-color'
  Plug 'chiel92/vim-autoformat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'embear/vim-localvimrc'
  Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
  Plug 'parkr/vim-jekyll'
  Plug 'jceb/vim-orgmode'
  Plug 'junegunn/gv.vim'
  Plug 'mattn/emmet-vim', {'for': 'html,hbs' }
  Plug 'mattn/webapi-vim'
  Plug 'mhinz/vim-signify'
  Plug 'moll/vim-node', { 'for': 'javascript' }

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'fszymanski/fzf-gitignore', { 'do' : ':UpdateRemotePlugins' }
  Plug 'tweekmonster/fzf-filemru'

  Plug 'henrik/vim-indexed-search'

  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bogado/file-line'
  Plug 'farmergreg/vim-lastplace'
  Plug 'Shougo/echodoc.vim'
  Plug 'keith/investigate.vim'

  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'

  Plug 'tmux-plugins/vim-tmux'
  Plug 'tmux-plugins/vim-tmux-focus-events'

  Plug 'powerman/vim-plugin-AnsiEsc'
  Plug 'majutsushi/tagbar'
  Plug 'jsfaint/gen_tags.vim'
  Plug 'zhm/TagHighlight'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-surround'
  Plug 'raimondi/delimitmate'
  Plug 'godlygeek/tabular'
  Plug 'glts/vim-cottidie'
  Plug 'ryanss/vim-hackernews'
  Plug 'Shougo/context_filetype.vim'

  Plug 'sheerun/vim-polyglot'
  Plug 'lambdalisue/vim-pyenv', { 'for': 'python' }
  Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
  Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
  Plug 'moll/vim-node', { 'for': 'javascript' }
  Plug 'ekalinin/Dockerfile.vim', {'for': 'dockerfile'}
  Plug 'mattly/vim-markdown-enhancements', {'for':'markdown,mkd'}

  Plug 'reedes/vim-wordy'
  Plug 'kana/vim-textobj-user'
  Plug 'reedes/vim-pencil'
  Plug 'reedes/vim-textobj-sentence'
  Plug 'reedes/vim-textobj-quote'
  Plug 'reedes/vim-lexical'
  Plug 'dbmrq/vim-ditto'
  Plug 'reedes/vim-litecorrect'

  " {{{ IDE-esque
  Plug 'roxma/nvim-completion-manager'
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-cm-tern',  { 'do': 'ndenv exec npm install' }
  Plug 'calebeby/ncm-css', { 'for': 'css' }
  Plug 'roxma/ncm-github'
  Plug 'Shougo/neco-vim', { 'for': 'vim' }
  Plug 'Shougo/neco-syntax'
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }
  Plug 'fisadev/vim-isort', { 'for': 'python' }
  Plug 'othree/csscomplete.vim', { 'for': 'css' }
  Plug 'elixir-editors/vim-elixir', {'for': 'elixir' }
  Plug 'roxma/ncm-rct-complete', {'for': 'ruby'}
  Plug 'Shougo/neoinclude.vim'
  Plug 'rust-lang/rust.vim', {'for': 'rust'}
  Plug 'racer-rust/vim-racer', {'for': 'rust'}
  Plug 'roxma/nvim-cm-racer', {'for': 'rust'}
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
  " }}}

  Plug 'sirver/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'roxma/vim-tmux-clipboard'

  Plug 'tpope/vim-vinegar'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'ryanoasis/vim-devicons'

  call plug#end()
endfunc " }}}

func! jalcine#plugins#configure() abort " {{{
  " airline {{{
  let g:airline_theme = 'base16'
  if exists('g:airline')
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
  endif
  let g:airline_detect_iminsert = 1
  let g:airline_detected_modified = 1
  let g:airline_powerline_fonts = 1
  if exists('g:airline_symbols')
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.readonly = '🔒'
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.whitespace = 'Ξ'
  endif

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
  "
  " fzf {{{
  let g:fzf_buffers_jump = 1
  let g:fzf_history_dir = expand('$HOME/.config/nvim/fzf-history')
  let g:fzf_gitignore_map = '<Leader>sgi'
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
  call neomake#configure#automake('rnw', 500)
  " }}}
  "
  " tagbar {{{
  let g:tagbar_autofocus = 0
  let g:tagbar_autoshowtag = 1
  let g:tagbar_compact = 1
  " }}}
  "
  " {{{ echodoc
  let g:echodoc#enable_at_startup = 1
  " }}}
  "
  " ultisnips {{{
	let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  let g:UltiSnipsRemoveSelectModeMappings = 0
  " }}}
  "
  " test {{{
  let g:test#preserve_screen = 1
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
  " }}}
  "
  " signify {{{
  let g:signify_vcs_list              = [ 'git', 'bzr' ]
  let g:signify_cursorhold_insert     = 0
  let g:signify_cursorhold_normal     = 1
  let g:signify_update_on_bufenter    = 1
  let g:signify_update_on_focusgained = 1
  let g:signify_realtime = 1
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
  let g:pyenv#auto_activate = 1
  let g:pyenv#auto_create_ctags = 1
  let g:pyenv#auto_assign_ctags = 1
  " }}}
  "
  " rooter {{{
  let g:rooter_use_lcd = 1
  let g:rooter_silent_chdir = 1
  let g:rooter_resolve_links = 1
  let g:rooter_change_directory_for_non_project_files = ''
  " }}}
  "
  " indentline {{{
  let g:indentLine_showFirstIndentLevel = 1
  let g:indentLine_setColors = 1
  let g:indentLine_leadingSpaceEnabled = 0
  let g:indentLine_fileTypeExclude = ['tagbar', 'help', 'netrw', 'gitcommit', 'startify']
  let g:indentLine_char = '┊'
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
  " misc {{{
  let g:alchemist#elixir_erlang_src = '/usr/local/share/src'
  let g:localvimrc_persistent = 2
  let g:python_highlight_all = 1
  let g:notes_suffix = '.txt'
  let g:far#source = 'agnvim'
  let g:gen_tags#ctags_auto_gen = 1
  let g:gen_tags#gtags_auto_gen = 1
  let g:gen_tags#blacklist = [expand('$HOME')]
  let g:gen_tags#ctags_use_cache_dir = expand('$HOME/.config/nvim/tags')
  " }}}
  "
  " {{{ investigate.vim
  let g:investigate_use_dash = 1
  let g:investigate_use_dash_for_vim = 1
  let g:investigate_syntax_for_dockerfile = 'docker'
  " }}}

  " {{{ orgmode
  let g:org_aggressive_conceal = 1
  let g:org_indent = 1
  let g:org_todo_keywords = [['TODO(t)', '|', 'DONE(d)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]
  " }}}

  call <SID>ConfigureLanguageServer()
endfunc " }}}

func! s:ConfigureLanguageServer() abort " {{{
  let l:vimrc_root = fnamemodify($MYVIMRC, ':p:h')
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'javascript': [ 'ndenv', 'exec', 'node', l:vimrc_root . '/plugins/javascript-typescript-langserver/lib/language-server-stdio.js' ],
        \ 'python': ['pyenv', 'exec', 'pyls'],
        \ 'go': ['goenv', 'exec', 'go-langserver'],
        \ 'php': ['phpenv', 'exec', l:vimrc_root . '/plugins/php-language-server/vendor/bin/php-language-server.php'],
        \ 'elixir': ['exenv', 'exec', l:vimrc_root . '/plugins/elixir-ls/apps/language_server'],
        \ 'ruby': ['rbenv', 'exec', 'language_server']
        \ }

  if exists('$DEBUG')
    let g:LanguageClient_serverCommands.javascript += ['--trace', '--logfile', l:vimrc_root . '/logs/lsp-javascript.log' ]
    let g:LanguageClient_serverCommands.python += ['--log-file', l:vimrc_root . '/logs/lsp-python.log' ]
    let g:LanguageClient_serverCommands.go += ['-logfile', l:vimrc_root . '/logs/lsp-go.log' ]
  endif

  let l:aliases = {
        \ 'javascript': ['javascript.jsx', 'jsx']
        \ }

  for l:alias in keys(l:aliases)
    for subAlias in l:aliases[l:alias]
      let g:LanguageClient_serverCommands[subAlias] = g:LanguageClient_serverCommands[l:alias]
    endfor
  endfor
endfunc " }}}

func! jalcine#plugins#configure_mappings() abort " {{{
  " Show me a tagbar!
  nnoremap <silent> <F9> :TagbarToggle<CR>
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
  "
  "
  " fzf {{{
  " Binds commands for using the fuzzy finder.
  call jalcine#mappings#apply_bulk([
        \ ['f', ':Files<cr>'],
        \ ['gf', ':GFiles?<cr>'],
        \ ['t', ':Tags<cr>'],
        \ ['h', ':History<cr>'],
        \ ['w', ':Windows<cr>'],
        \ ['c', ':Commits<cr>'],
        \ ['b', ':Buffers<cr>'],
        \ ['s', ':Snippets<cr>'],
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
        \ ['st', ':SignifyToggle<CR>'],
        \ ['sh', ':SignifyToggleHighlight<CR>'],
        \ ['sr', ':SignifyRefresh<CR>'],
        \ ['sd', ':SignifyDebug<CR>'],
        \ ['sj', '<plug>(signify-next-hunk)'],
        \ ['sk', '<plug>(signify-prev-hunk)'],
        \ ], { 'prefix': 'g' })
  " }}}
  "
  " investiage {{{
  call jalcine#mappings#apply_bulk([
        \ ['K', "call investigate#Investigate('n')<CR>"],
        \ ], { 'prefix': 'i' })
  " }}}
  " ncm {{{(
  
  " Attempt to expand snippet when I hit <Enter>, if any.
  imap <expr> <CR> (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)" : "\<CR>")
  imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<C-u>":"\<CR>")
  "
  " Trigger expansion for snippet completion in ncm's window.
	inoremap <silent> <C-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
  "
  " }}}
endfunc " }}}

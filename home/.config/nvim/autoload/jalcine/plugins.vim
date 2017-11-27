" File:          autoload/jalcine/plugins.vim
" Description:   Setup the plugins I'll be using.
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: 2017-10-18 23:03:46 PDT
" vim: set fdm=marker fdl=0 :

scriptencoding utf-8

let s:vimrc_root = fnamemodify($MYVIMRC, ':p:h')

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

  " Check everything.
  if exists('$NVIM_VERBOSE')
    let $NVIM_PYTHON_LOG_FILE=expand('$HOME/.config/nvim/logs/python.log')
  endif

  " Go into orbit.
  filetype plugin indent on
  syntax on

  " Define mappings.
  call jalcine#plugins#configure_mappings()
endfunc " }}}

func! jalcine#plugins#define() abort " {{{
  call plug#begin(g:jalcine.plugins.root)

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-projectionist'
  Plug 'jdelkins/vim-correction'
  Plug 'tpope/vim-scriptease'
  Plug 'tpope/vim-rsi'
  Plug 'vim-utils/vim-husk'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'janko-m/vim-test'
  Plug 'tpope/vim-dotenv'
  Plug 'direnv/direnv.vim'
  Plug 'w0rp/ale'
  Plug 'janko-m/vim-test'

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
  Plug 'jaxbot/github-issues.vim'

  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'chiel92/vim-autoformat'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'embear/vim-localvimrc'
  Plug 'gabrielelana/vim-markdown'
  Plug 'parkr/vim-jekyll'
  Plug 'jceb/vim-orgmode'
  Plug 'mattn/calendar-vim'
  Plug 'vim-scripts/SyntaxRange'
  Plug 'chrisbra/NrrwRgn'
  Plug 'junegunn/gv.vim'
  Plug 'mattn/emmet-vim'
  Plug 'mattn/webapi-vim'
  Plug 'mhinz/vim-signify'
  Plug 'moll/vim-node'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'fszymanski/fzf-gitignore', { 'do' : ':UpdateRemotePlugins' }
  Plug 'tweekmonster/fzf-filemru'

  Plug 'henrik/vim-indexed-search'

  Plug 'chriskempson/base16-vim'
  Plug 'bogado/file-line'
  Plug 'farmergreg/vim-lastplace'
  Plug 'Shougo/echodoc.vim'
  " Plug 'keith/investigate.vim'
  Plug '~/src/investigate.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'

  Plug 'tmux-plugins/vim-tmux'
  Plug 'tmux-plugins/vim-tmux-focus-events'

  Plug 'powerman/vim-plugin-AnsiEsc'
  Plug 'zhm/TagHighlight'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'majutsushi/tagbar'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-surround'
  Plug 'raimondi/delimitmate'
  Plug 'godlygeek/tabular'
  Plug 'glts/vim-cottidie'
  Plug 'ryanss/vim-hackernews'
  Plug 'Shougo/context_filetype.vim'
  Plug 'tweekmonster/startuptime.vim'
  Plug 'wakatime/vim-wakatime'

  Plug 'sheerun/vim-polyglot'
  Plug 'lambdalisue/vim-pyenv'
  Plug 'jmcantrell/vim-virtualenv'
  Plug 'tmhedberg/SimpylFold'
  Plug 'vim-ruby/vim-ruby'
  Plug 'mxw/vim-jsx'
  Plug 'moll/vim-node'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'mattly/vim-markdown-enhancements'
  Plug 'tweekmonster/braceless.vim'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'othree/yajs.vim'
  Plug 'othree/jsdoc-syntax.vim'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'othree/es.next.syntax.vim'

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
  Plug 'roxma/nvim-cm-tern',  { 'do': 'npm install' }
  Plug 'roxma/ncm-github'
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/neoinclude.vim'
  Plug 'calebeby/ncm-css'
  Plug 'Shougo/neco-vim'
  Plug 'davidhalter/jedi-vim'
  Plug 'fisadev/vim-isort'
  Plug 'othree/csscomplete.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'roxma/ncm-rct-complete'
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
  Plug 'roxma/nvim-cm-racer'
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
  Plug 'JakeBecker/elixir-ls', { 'do' : 'mix do deps.get, deps.compile, compile' }
  Plug 'fgrsnau/ncm-otherbuf'
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
  " endwise
  let g:endwise_no_mappings = 1
  " fzf {{{
  let g:fzf_buffers_jump = 1
  let g:fzf_history_dir = expand('$HOME/.config/nvim/fzf-history')
  let g:fzf_gitignore_map = '<Leader>sgi'
  " }}}
  "
  " {{{ ale
  let g:ale_fix_on_save = 1
  let g:ale_lint_on_save = 1
  let g:ale_echo_delay = 1
  let g:ale_lint_on_text_changed = 0
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
  " gutentags {{{
  " )}}}
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
  let g:rooter_change_directory_for_non_project_files = ''
  " }}}
  "
  " indentline {{{
  let g:indentLine_showFirstIndentLevel = 1
  let g:indentLine_leadingSpaceEnabled = 1
  let g:indentLine_fileTypeExclude = ['netrw', 'gitcommit', 'startify']
  let g:indentLine_setConceal = 1
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
  " {{{ investigate.vim
  let g:investigate_use_dash = 1
  let g:investigate_use_dash_for_vim = 1
  let g:investigate_syntax_for_dockerfile = 'docker'
  " }}}

  " {{{ orgmode
  let g:org_aggressive_conceal = 1
  let g:org_indent = 1
  let g:org_todo_keywords = [['TODO(t)', 'ACTIVE(a)', '|', 'DONE(d)'],
        \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
        \ ['CANCELED(c)']]
  " }}}
  "
  " ale {{{
  let g:ale_scss_stylelint_executable = s:vimrc_root . "/node_modules/.bin/stylelint"
  let g:ale_fixers = {
        \ 'css': [
        \   'stylelint'
        \ ],
        \ 'scss': [
        \   'stylelint'
        \ ]
        \ }
  " }}}
  "
  " investigate {{{
  let g:investigate_command_for_elixir = '/usr/bin/zeal ^s'
  " }}}
  "
  " {{{ vim-test
  " }}}

  let g:localvimrc_persistent = 2
  let g:python_highlight_all = 1
  let g:notes_suffix = '.txt'
  let g:far#source = 'agnvim'
  call <SID>ConfigureLanguageServer()
  call <SID>ConfigureTagbar()
  call jalcine#plugins#configure_status()
endfunc " }}}

" TODO: Add info for ALE.
" TODO: Show anyenv data.
func! jalcine#plugins#configure_status() abort " {{{
  let g:lightline = {}
  let g:lightline.active = {
        \ 'left': [ [ 'mode' ],
        \           [ 'gitbranch' ],
        \           [ 'relativepath' ] ],
        \ 'right': [ [ 'paste', 'fileicon' ],
        \            [ 'pos', 'modified', 'readonly' ],
        \            [ ]  ] }
  let g:lightline.inactive = {
        \ 'left': [ [ 'filename' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ] ] }
  let g:lightline.tabline = {
        \ 'left': [ [ 'tabs' ] ],
        \ 'right': [ [ 'pos', 'close' ] ] }
  let g:lightline.tab = {
        \ 'active': [ 'tabnum', 'filename', 'modified' ],
        \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
  let g:lightline.component = {
        \ 'readonly': '🔒',
        \ 'pos': ' %l:%c / B:%n W: %{winnr()}',
        \ 'spell': 'Ꞩ %{&spelllang}',
        \ 'gitbranch': ' %{fugitive#head()}',
        \ }
  let g:lightline.component_function = {
        \ 'fileicon': 'WebDevIconsGetFileTypeSymbol'
        \ }
  let g:lightline.component_visible_condition = {
        \ 'gitbranch': 'fugitive#head() !== ""',
        \ }
	let g:lightline.separator = { 'left': '', 'right': '' }
	let g:lightline.subseparator =  { 'left': '', 'right': '' }
  let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ }
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
        \ ['mv', ':call fzf#vim#maps("v", 1)<cr>'],
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
  " ncm {{{
  " Expand a snippet when shown in the list.
  imap <expr> <CR> (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
  imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<Plug>(ultisnips_expand)" :"\<CR>")

  " }}}
endfunc " }}}

func! s:ConfigureLanguageServer() abort " {{{
  let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'javascript': [ 'ndenv', 'exec', 'node', s:vimrc_root . '/plugins/javascript-typescript-langserver/lib/language-server-stdio.js' ],
        \ 'python': ['pyenv', 'exec', 'pyls'],
        \ 'go': ['goenv', 'exec', 'go-langserver'],
        \ 'php': ['phpenv', 'exec', s:vimrc_root . '/plugins/php-language-server/vendor/bin/php-language-server.php'],
        \ 'ruby': [ s:vimrc_root . '/bin/language_server-ruby' ],
        \ 'elixir': [ 'PWD="' . s:vimrc_root . '/plugins/elixir-ls" mix', 'elixir_ls.debugger' ]
        \ }

  if exists('$DEBUG')
    let g:LanguageClient_trace = "verbose"
    let g:LanguageClient_windowLogMessageLevel = "Log"
    let g:LanguageClient_serverCommands.javascript += ['--trace', '--logfile', s:vimrc_root . '/logs/lsp-javascript.log' ]
    let g:LanguageClient_serverCommands.python += ['--log-file', s:vimrc_root . '/logs/lsp-python.log' ]
    let g:LanguageClient_serverCommands.go += ['-logfile', s:vimrc_root . '/logs/lsp-go.log' ]
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

func! s:ConfigureTagbar() abort " {{{
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
        \ 'ctagsbin'   : s:vimrc_root . '/bin/ripper-tags',
        \ 'ctagsargs'  : ['-f', '-']
        \ }
  let g:tagbar_type_javascript = {
        \ 'ctagsbin'   : s:vimrc_root . '/node_modules/.bin/jsctags',
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
endfunc " }}}

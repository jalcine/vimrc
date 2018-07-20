" File:          autoload/jalcine/plugins.vim
" Description:   Setup the plugins I'll be using.
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: 2017-10-18 23:03:46 PDT
" vim: set fdm=marker fdl=0 :

let s:vimrc_root = fnamemodify($MYVIMRC, ':p:h')

scriptencoding utf-8
" Options {{{
let g:jalcine.plugins = {
      \ 'root': expand('$HOME/.config/nvim/plugins'),
      \ }
" }}}

func! jalcine#plugins#setup() abort " {{{
  filetype off

  call jalcine#plugins#configure()
  call jalcine#plugins#define()

  filetype plugin indent on
  syntax on

  call jalcine#plugins#configure_mappings()
endfunc " }}}

func! jalcine#plugins#define() abort " {{{
  let l:vimrc_root = s:vimrc_root

  call plug#begin(g:jalcine.plugins.root)

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
  Plug 'junegunn/vim-emoji'

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'tommcdo/vim-fubitive'
  Plug 'tommcdo/vim-fugitive-blame-ext'
  Plug 'idanarye/vim-merginal'
  Plug 'mattn/gist-vim'
  Plug 'nkantar/ght.vim'
  " TODO: Add mappings for GHT into :GCommit window.
  Plug 'junegunn/vim-github-dashboard'
  Plug 'jaxbot/github-issues.vim'
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
  Plug 'mattn/emmet-vim'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        \ | Plug 'junegunn/fzf.vim'
        \ | Plug 'fszymanski/fzf-gitignore', { 'do' : ':UpdateRemotePlugins' }
        \ | Plug 'tweekmonster/fzf-filemru'

  Plug 'henrik/vim-indexed-search'

  Plug 'chriskempson/base16-vim'
  Plug 'Shougo/echodoc.vim'
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
  Plug 'Shougo/context_filetype.vim'
  Plug 'tweekmonster/startuptime.vim'
  Plug 'wakatime/vim-wakatime'

  Plug 'sheerun/vim-polyglot'
  Plug 'lambdalisue/vim-pyenv', { 'for': 'python' }
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'tweekmonster/braceless.vim'
  Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
  Plug 'jalcine/cmake.vim'
  Plug 'cquery-project/cquery', { 'for': 'c,c++',
        \ 'do': 'mkdir -p build && cd build && cmake .. && make' }
  Plug 'gorodinskiy/vim-coloresque'

  Plug 'reedes/vim-wordy'
  Plug 'kana/vim-textobj-user'
  Plug 'reedes/vim-pencil'
  Plug 'reedes/vim-textobj-sentence'
  Plug 'reedes/vim-textobj-quote'
  Plug 'reedes/vim-lexical'
  Plug 'dbmrq/vim-ditto'
  Plug 'reedes/vim-litecorrect'

  " {{{ IDE-esque
  Plug 'vim-scripts/dbext.vim'
  Plug 'roxma/nvim-completion-manager'
  Plug 'autozimu/LanguageClient-neovim',
        \ {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
  Plug 'roxma/ncm-github'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'calebeby/ncm-css', { 'for': 'css' }
  Plug 'davidhalter/jedi-vim', {'for': 'python'}
  Plug 'fisadev/vim-isort', {'for': 'python'}
  Plug 'othree/csscomplete.vim', {'for': 'css'}
  Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
  Plug 'roxma/ncm-rct-complete', {'for': 'ruby'}
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh', 'for': 'elixir' }
  Plug 'JakeBecker/elixir-ls', {
        \ 'do' : 'mix do deps.get, deps.compile, compile, elixir_ls.release -o ' . l:vimrc_root . '/bin',
        \ 'for': 'elixir' }
  Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'ndenv exec npm install && npm run build', 'for': 'javascript' }
  Plug 'roxma/LanguageServer-php-neovim',  {'do': 'phpenv exec composer install && composer run-script parse-stubs'}
  " }}}

  Plug 'sirver/ultisnips'
        \ |  Plug 'honza/vim-snippets'

  Plug 'roxma/vim-tmux-clipboard'

  Plug 'mhinz/vim-startify'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'bronson/vim-trailing-whitespace'

  call plug#end()
endfunc " }}}

func! jalcine#plugins#configure() abort " {{{
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
  let g:ale_scss_stylelint_executable = s:vimrc_root . "/node_modules/.bin/stylelint"
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
        \ 'json': [
        \   'jq'
        \ ],
        \ 'python': [
        \   'isort',
        \   'autopep8',
        \   'add_blank_lines_for_python_control_statements'
        \ ]
        \ }
  let g:ale_fixers['vue'] = g:ale_fixers['javascript']
  let g:ale_fixers['jsx'] = g:ale_fixers['javascript']
  let g:ale_fixers['typescript'] = g:ale_fixers['javascript']
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
        \ 'silent! jalcine#tweaks#terminal#kill_extra_buffers()'
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
        \ ['mc', ':call fzf#vim#maps("c", 1)<cr>'],
        \ ['mt', ':call fzf#vim#maps("t", 1)<cr>'],
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
  call jalcine#mappings#apply_bulk([
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
  call jalcine#mappings#apply_bulk([
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
  imap <expr> <CR> (pumvisible() ?  "\<c-y>\<Plug>(expand_or_nl)\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
  imap <expr> <Plug>(expand_or_nl) (cm#completed_is_snippet() ? "\<Plug>(ultisnips_expand)\<CR>" : "\<CR>")
  imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " }}}
  "
  " {{{ LanguageClient
  nnoremap <silent> gK :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>
  " }}}

  nnoremap <silent> <CR><CR> :call <SID>ReloadPlugins()<CR>
  nnoremap <silent> <C-CR>   :call jalcine#plugins#capture()
endfunc " }}}

func! jalcine#plugins#capture() abort
  silent! PlugSnapshot! $HOME/.config/nvim/snapshot.vim
  silent! bd!
endfunc

func! s:ReloadPlugins() abort
  PlugInstall!
  PlugUpdate!
  PlugClean!
endfunc

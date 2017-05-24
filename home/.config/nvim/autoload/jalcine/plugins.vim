scriptencoding utf-8

let g:jalcine = {
      \ 'plugins': {
      \   'dir': expand('$HOME/.config/nvim/plugins')
      \ },
      \ 'color': {
      \   'scheme': 'nord',
      \   'airline_theme': 'nord',
      \   'background': 'dark'
      \ }
      \ }

func! jalcine#plugins#configure() abort
  let g:echodoc#enable_at_startup = 1
  let g:ropevim_guess_project = 1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeAutoDeleteBuffer = 1

  let g:codi#log = expand('$HOME/.config/nvim/logs/codi.log')
  let g:pyenv#auto_create_ctags = 0
  let g:pyenv#auto_activate = 0
  let g:pyenv#auto_assign_ctags = 0

  let g:textobj#quote#educate = 0
  let g:textobj#sentence#abbreviations = [
        \ '[ABCDIMPSUabcdegimpsv]',
        \ 'l[ab]', '[eRr]d', 'Ph', '[Ccp]l', '[Lli]n', '[cn]o',
        \ '[Oe]p', '[DJMSh]r', '[MVv]s', '[CFMPScfpw]t',
        \ 'alt', '[Ee]tc', 'div', 'es[pt]', '[Ll]td', 'min',
        \ '[MD]rs', '[Aa]pt', '[Aa]ve?', '[Ss]tr?',
        \ '[Aa]ssn', '[Bb]lvd', '[Dd]ept', 'incl', 'Inst', 'Prof', 'Univ',
        \ ]

  let g:jsdoc_additional_descriptions = 1
  let g:jsdoc_access_descriptions = 1
  let g:jsdoc_enable_es6 = 1
  let g:jsdoc_underscore_private = 1
  let g:jsdoc_custom_args_hook = {
        \ 'callback\|cb': {
        \   'type': ' {Function} ',
        \   'description': 'Callback function'
        \ }
        \}

  let g:test#preserve_screen = 0
  let g:test#strategy = {
        \ 'nearest': 'neovim',
        \ 'file':    'dispatch',
        \ 'suite':   'neovim',
        \ }


  let g:plug_window = 'botright new | resize 5'

  let g:rooter_use_lcd = 1
  let g:rooter_silent_chdir = 0
  let g:rooter_resolve_links = 1

  let g:notes_suffix = '.txt'

  let g:vim_json_syntax_conceal = 1

  let g:fzf_command_prefix = 'Fzf'

  " {{{ airline
  let g:airline#extensions#hunks#non_zero_only = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#whitespace#enabled = 1
  let g:airline#extensions#whitespace#mixed_indent_algo = 1
  let g:airline#extensions#whitespace#show_message = 1
  let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
  let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
  let g:airline#extensions#neomake#enabled = 1
  let g:airline_detected_modified = 1
  let g:airline_powerline_fonts = 1
  let g:airline_detect_iminsert = 0
  let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'v'  : 'V',
        \ 'V'  : 'B'
        \ }
  let g:airline#extensions#branch#format = 'Git_flow_branch_format'
  " }}}

  " {{{ nerd*
  let g:NERDCreateDefaultMappings = 1
  let g:NERDCompactSexyComs = 1
  let g:NERDSpaceDelims = 1
  let g:NERDRemoveExtraSpaces = 1
  let g:NERDTrimTrailingWhitespace = 1
  " }}}
  
  " {{{ License stuff
  let g:licenses_copyright_holders_name = 'Jacky Alciné <yo@jacky.wtf>'
  let g:licenses_authors_name = 'Jacky Alciné'
  let g:licenses_default_commands = ['agpl', 'mit', 'apache']
  " }}}
  
  let g:vim_markdown_toc_autofit = 1
  let g:vim_markdown_frontmatter = 1

  " {{{ ultisnips
  let g:snips_author = 'Jacky Alciné <yo@jacky.wtf>'
  let g:UltiSnipsEnableSnipMate = 1
  let g:UltiSnipsEditSplit = 'context'
  let g:UltiSnipsSnippetDirectories = [$HOME. '/.config/nvim/snippets']
  let g:UltiSnipsExpandTrigger = '<c-j>'

  " }}}

  " {{{ vim-bookmarks
  let g:bookmark_center = 1
  let g:bookmark_sign = '♥'
  let g:bookmark_highlight_lines = 1
  let g:bookmark_auto_close = 1
  let g:bookmark_auto_save = 1
  let g:bookmark_auto_save_file = expand('$HOME/.config/nvim/bookmarks.txt')
  let g:bookmark_location_list = 1
  " "}}

  " {{{ signify
  let g:signify_vcs_list              = [ 'git', 'hg' ]
  let g:signify_cursorhold_insert     = 1
  let g:signify_cursorhold_normal     = 1
  let g:signify_update_on_bufenter    = 0
  let g:signify_update_on_focusgained = 1
  " }}}

  " {{{ ag
  let g:ag_prg = 'ag --vimgrep --smart-case --noheading'
  let g:ag_highlight = 1
  " }}}

  let g:neomake_list_height = 5
  let g:neomake_open_list = 2
  let g:neomake_serialize = 0
  let g:neomake_serialize_abort_on_error = 0
  let g:neomake_verbose = 1
  let g:neomake_remove_invalid_entries = 1
  let g:neomake_logfile = expand('$HOME/.config/nvim/logs/neomake.log')
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy', 'pylint']
  let g:neomake_scss_enabled_makers = ['scss-lint']
  let g:neomake_sh_enabled_makers = ['shellcheck']
  let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
  let g:neomake_vim_enabled_makers = ['vint']
  let g:neomake_elixir_enabled_makers = ['mix', 'credo']

  let g:session_autosave = 'yes'
  let g:startify_files_number = 10
  let g:startify_change_to_dir = 0
  let g:startify_change_to_vcs_root = 0
  let g:startify_relative_path = 1
  let g:startify_session_dir = '~/.config/nvim/sessions'

  let g:localvimrc_persistent = 1

  let g:EditorConfig_max_line_indicator = 'line'
  let g:vim_isort_python_version = 'python3'

  " {{{ easytags
  let g:easytags_async = 1
  let g:easytags_auto_highlight = 0
  let g:easytags_autorecurse = 0
  let g:easytags_by_filetype = '~/.config/nvim/tags/by-filetype'
  let g:easytags_dynamic_files = 2
  let g:easytags_events = ['BufReadPost']
  let g:easytags_file = '~/.config/nvim/tags/db'
  let g:easytags_include_members = 1
  let g:easytags_resolve_links = 1
  let g:easytags_languages = {
        \ 'javascript': {
        \   'cmd': 'jsctags',
        \   'args': [],
        \   'fileoutput_opt': '-f',
        \   'stdout_opt': '-f-',
        \   'recurse_flag': '-R'
        \   }
        \ }
  " }}}

  let g:indent_guides_guide_size = 2
  let g:indent_guides_start_level = 1
  let g:indent_guides_color_change_percent = 2
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

  let g:goyo_width = 100
  let g:goyo_height = '85%'
  let g:goyo_linenr = 0

  let g:tex_fold_enabled = 1
  let g:vimsyn_folding = 'af'
  let g:xml_syntax_folding = 1
  let g:php_folding = 1
  let g:perl_fold = 1

  let g:fastfold_skip_filetypes = ['nerdtree']
  let g:SimpylFold_docstring_preview = 1
  let g:python_highlight_all=1

  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_collect_identifiers_from_tags_files = 0
  let g:ycm_add_preview_to_completeopt = 0

  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1

  let g:org_indent = 1
  let g:org_aggressive_conceal = 0
  let g:org_todo_keywords = [['TODO', 'WAITING', 'ACTIVE', '|', 'DONE'],
        \   ['|', 'CANCELED']]
  let g:org_todo_keyword_faces = [
        \ ['WAITING', 'cyan'],
        \ ['CANCELED',
        \   [':foreground red', ':background black', ':weight bold', ':slant italic', ':decoration underline']],
        \ ['ACTIVE', [':foreground:pink', ':weight bold']]
        \ ]
endfunc

func! jalcine#plugins#define() abort
  call g:plug#begin(g:jalcine.plugins.dir)

  " {{{ External support
  Plug 'KabbAmine/zeavim.vim'
  Plug 'guns/xterm-color-table.vim'
  Plug 'arcticicestudio/nord-vim', { 'tag': 'v0.5.0' }
  Plug 'tmux-plugins/vim-tmux'
        \ | Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        \ | Plug 'junegunn/fzf.vim'
  Plug 'metakirby5/codi.vim'
  Plug 'mattn/calendar-vim'
  Plug 'rking/ag.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-dotenv'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-rsi'
        \ | Plug 'vim-utils/vim-husk'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'

  " }}}
  " {{{ Editor Enhancement
  Plug 'sbdchd/neoformat'
  Plug 'scrooloose/nerdcommenter'

  Plug 'antoyo/vim-licenses'
  Plug 'Valloric/YouCompleteMe', { 'do': 'neovim-install-ycm' }
        \ | Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  Plug 'jeaye/color_coded', {
        \ 'do': 'cmake . && make && make install',
        \ 'for': 'c,cpp',
        \ 'on': 'CCtoggle' }
  Plug 'vim-airline/vim-airline'
        \ | Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/SyntaxRange'
  Plug 'vim-scripts/utl.vim'
  Plug 'vim-utils/vim-interruptless'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-endwise'
  Plug 'Konfekt/FastFold'
  Plug 'bogado/file-line'
  Plug 'Shougo/echodoc.vim'
  Plug 'SirVer/ultisnips'
  Plug 'abudden/taghighlight-automirror'
  Plug 'benekastah/neomake'
  Plug 'janko-m/vim-test'
  Plug 'henrik/vim-indexed-search'
  Plug 'godlygeek/tabular'
  Plug 'kopischke/vim-stay'
  Plug 'jamessan/vim-gnupg'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'mhinz/vim-startify'
  Plug 'mhinz/vim-signify'
  Plug 'machakann/vim-highlightedyank'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'radenling/vim-dispatch-neovim'
  Plug 'xolox/vim-easytags'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-session'
  Plug 'xolox/vim-shell'
  Plug 'terryma/vim-multiple-cursors'
  " }}}
  " {{{ Language Support
  Plug 'lervag/vimtex', { 'for': 'latex,tex' }
  Plug 'sheerun/vim-polyglot' " General language support.
  Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
  Plug 'bpstahlman/txtfmt', { 'for': 'text.fmt' }
  Plug 'fatih/vim-go', { 'for': 'go' }
  Plug 'hashivim/vim-terraform'
  Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
  Plug 'jceb/vim-orgmode'
  Plug 'lambdalisue/vim-pyenv', { 'for': 'python' }
        \ | Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
        \ | Plug 'fisadev/vim-isort', { 'for': 'python' }
        \ | Plug 'python-rope/ropevim', { 'for': 'python' }
        \ | Plug 'heavenshell/vim-pydocstring', { 'for': 'python' }
  Plug 'kana/vim-textobj-user'
  Plug 'tpope/vim-scriptease'
  Plug 'reedes/vim-litecorrect', { 'for' : 'text,markdown,org' }
  Plug 'reedes/vim-pencil', { 'for' : 'text,markdown,org' }
  Plug 'kana/vim-textobj-user', { 'for' : 'text,markdown,org' }
        \ | Plug 'reedes/vim-textobj-quote', { 'for' : 'text,markdown,org' }
        \ | Plug 'reedes/vim-textobj-sentence', { 'for' : 'text,markdown,org' }
  Plug 'reedes/vim-wordy', { 'for' : 'text,markdown,org' }
  Plug 'tpope/vim-jdaddy', { 'for': 'json' }
  Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
  Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
  Plug 'vimperator/vimperator.vim'
  Plug 'saltstack/salt-vim'
  " }}}
  " {{{ Project Support
  Plug 'mattesgroeger/vim-bookmarks'
  Plug 'tpope/vim-fugitive'
        \ | Plug 'tommcdo/vim-fugitive-blame-ext'
        \ | Plug 'tpope/vim-rhubarb'
  Plug 'direnv/direnv.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'embear/vim-localvimrc'
  Plug 'airblade/vim-rooter'
  Plug 'honza/vim-snippets'
  Plug 'idanarye/vim-merginal'
  Plug 'scrooloose/nerdtree'
        \ | Plug 'jistr/vim-nerdtree-tabs'
        \ | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        \ | Plug 'xuyuanp/nerdtree-git-plugin'
        \ | Plug 'low-ghost/nerdtree-fugitive'
  Plug 'majutsushi/tagbar'
  Plug 'jreybert/vimagit'
  Plug 'mattn/webapi-vim'
        \ | Plug 'mattn/gist-vim', { 'on': 'Gist' }
  Plug 'renyard/vim-git-flow-format'
  " }}}
  
  call g:plug#end()
endfunc

func! jalcine#plugins#combind() abort
  let g:startify_bookmarks = bm#all_files()
endfunc

func! jalcine#plugins#open(name) abort
  let l:path = g:jalcine.plugins.dir . '/' . a:name
  exec(':edit ' . l:path)
endfunc

func! jalcine#plugins#setup() abort
  call jalcine#plugins#configure()
  call jalcine#plugins#update_python()
  call jalcine#plugins#define()
  call jalcine#plugins#combind()
  filetype plugin indent on
endfunc

func! jalcine#plugins#update() abort
  PlugUpdate
        \ | PlugUpgrade 
        \ | PlugSnapshot! ${HOME}/.config/nvim/locked-plugin-list.vim
endfunc

func! jalcine#plugins#install() abort
  source ${HOME}/.config/nvim/locked-plugin-list.vim
endfunc

func! jalcine#plugins#reparse() abort
  call jalcine#plugins#configure()
  call jalcine#plugins#define()
  exec('PlugClean!')
  call jalcine#plugins#update()
  call jalcine#plugins#install()
endfunc

func! jalcine#plugins#update_python() abort
  " Switch the internal provider versions that we'll want to use for Python.
  let g:python_host_prog=substitute(system('PYENV_VERSION=neovim-py2 pyenv which python2'), '^\n*\(.\{-}\)\n*$', '\1', '')")
  let g:python3_host_prog=substitute(system('PYENV_VERSION=neovim-py3 pyenv which python3'), '^\n*\(.\{-}\)\n*$', '\1', '')")

  " Update arguments.
  " TODO: How do we know which one takes priority for the particular project?
  let g:ycm_python_binary_path = g:python3_host_prog
  let g:ycm_server_python_interpreter = g:python3_host_prog
endfunc

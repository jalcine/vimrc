" vim: set fdm=syntax :

scriptencoding utf-8

func! plugins#configure() abort
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeAutoDeleteBuffer = 1

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
                \ 'suite':   'basic',
                \ }


    let g:plug_window = 'botright new | resize 5'

    let g:rooter_use_lcd = 1
    let g:rooter_silent_chdir = 1

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
    " }}}

    " {{{ nerd*
    let g:NERDCreateDefaultMappings = 1
    let g:NERDCompactSexyComs = 1
    let g:NERDSpaceDelims = 1
    let g:NERDRemoveExtraSpaces = 1
    " }}}

    " {{{ ultisnips
    let g:snips_author = 'Jacky Alciné <yo@jacky.wtf>'
    let g:UltiSnipsEnableSnipMate = 1
    let g:UltiSnipsUsePythonVersion = 3
    let g:UltiSnipsEditSplit = 'context'
    let g:UltiSnipsSnippetDirectories = [$HOME. '/.config/nvim/snippets']
    let g:UltiSnipsExpandTrigger = '<c-j>'

    " }}}

    " {{{ vim-bookmarks
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1
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

    let g:neomake_list_height = 3
    let g:neomake_open_list = 1
    let g:neomake_serialize = 1
    let g:neomake_serialize_abort_on_error = 1
    let g:neomake_verbose = 1
    let g:neomake_logfile = expand("$HOME/.config/nvim/neomake.log")
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy']
    let g:neomake_scss_enabled_makers = ['scss-lint']
    let g:neomake_sh_enabled_makers = ['shellcheck']
    let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']
    let g:neomake_vim_enabled_makers = ['vint']
    let g:neomake_elixir_enabled_makers = ['mix', 'credo']
    let s:custom_header =
                \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

    func! s:filter_header(lines) abort
        let l:longest_line = max(map(copy(a:lines), 'len(v:val)'))
        let l:centered_lines= map(copy(a:lines),
                    \ 'repeat(" ", (&columns / 2) - (l:longest_line / 2)) . v:val')
        return l:centered_lines
    endfunc

    " {{{ vim-session
    let g:session_autosave = 'yes'
    " }}}

    let g:startify_custom_header = s:filter_header(s:custom_header)
    let g:startify_files_number = 10
    let g:startify_change_to_dir = 0
    let g:startify_change_to_vcs_root = 0
    let g:startify_relative_path = 1
    let g:startify_session_dir = '~/.config/nvim/sessions'

    let g:localvimrc_persistent = 1

    let g:EditorConfig_max_line_indicator = "line"
    let g:vim_isort_python_version = 'python3'

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

    let g:indent_guides_guide_size = 2
    let g:indent_guides_start_level = 1
    let g:indent_guides_color_change_percent = 2
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

    let g:goyo_width = 100
    let g:goyo_height = '85%'
    let g:goyo_linenr = 0

    let g:autoformat_verbosemode = 1

    let g:tex_fold_enabled = 1
    let g:vimsyn_folding = 'af'
    let g:xml_syntax_folding = 1
    let g:php_folding = 1
    let g:perl_fold = 1

    let g:fastfold_skip_filetypes = ['nerdtree']
    let g:SimpylFold_docstring_preview = 1

    let g:ycm_python_binary_path = g:python3_host_prog
    let g:ycm_server_python_interpreter = g:python3_host_prog
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

func! plugins#define() abort
    call g:plug#begin(g:jalcine.plugins.dir)

    Plug 'rking/ag.vim'
          \ | Plug 'roxma/nvim-completion-manager'
          \ | Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
          \ | Plug 'Shougo/echodoc.vim'
          \ | Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

    Plug 'SirVer/ultisnips'
                \ | Plug 'honza/vim-snippets'
    Plug 'editorconfig/editorconfig-vim'
                \ | Plug 'bogado/file-line'
                \ | Plug 'farmergreg/vim-lastplace'
                \ | Plug 'airblade/vim-rooter'
                \ | Plug 'embear/vim-localvimrc'
                \ | Plug 'Konfekt/FastFold'
                \ | Plug 'kopischke/vim-stay'
                \ | Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
                \ | Plug 'direnv/direnv.vim'
                \ | Plug 'tpope/vim-dotenv'
                \ | Plug 'tpope/vim-obsession'

    Plug 'heavenshell/vim-jsdoc'
                \ | Plug 'KabbAmine/zeavim.vim'

    Plug 'benekastah/neomake'
    Plug 'janko-m/vim-test'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
                \ |  Plug 'junegunn/fzf.vim'

    Plug 'junegunn/goyo.vim'
                \ | Plug 'junegunn/limelight.vim'
                \ | Plug 'junegunn/vim-easy-align'

    Plug 'mattn/webapi-vim'
                \ | Plug 'mattn/gist-vim', { 'on': 'Gist' }

    Plug 'mhinz/vim-startify'
                \ | Plug 'xolox/vim-session'
                \ | Plug 'mattesgroeger/vim-bookmarks'

    " {{{ Code Discovery
    Plug 'TagHighlight'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable', 'on': 'YcmGenerateConfig' }
                \ | Plug 'Valloric/YouCompleteMe', { 'do': 'neovim-install-ycm' }
                \ | Plug 'xolox/vim-easytags'
                \ | Plug 'majutsushi/tagbar'
                \ | Plug 'othree/jspc.vim'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
                \ | Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
                \ | Plug 'low-ghost/nerdtree-fugitive', { 'on':  'NERDTreeToggle' }
                \ | Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
                \ | Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }

    " }}}

    Plug 'sheerun/vim-polyglot'
                \ | Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }
                \ | Plug 'fatih/vim-go'
                \ | Plug 'saltstack/salt-vim'

    Plug 'terryma/vim-multiple-cursors'
                \ | Plug 'nathanaelkane/vim-indent-guides'
                \ | Plug 'tpope/vim-dispatch'
                \ | Plug 'tpope/vim-endwise'
                \ | Plug 'tpope/vim-fugitive'
                \ | Plug 'tpope/vim-jdaddy', { 'for': 'json' }
                \ | Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
                \ | Plug 'tpope/vim-repeat'
                \ | Plug 'tpope/vim-rhubarb'
                \ | Plug 'tpope/vim-rsi'
                \ | Plug 'tpope/vim-speeddating'
                \ | Plug 'tpope/vim-surround'
                \ | Plug 'tpope/vim-vinegar'
                \ | Plug 'tpope/vim-abolish'
                \ | Plug 'radenling/vim-dispatch-neovim'
                \ | Plug 'vim-utils/vim-husk'
                \ | Plug 'vim-utils/vim-interruptless'
                \ | Plug 'sjl/gundo.vim'
                \ | Plug 'machakann/vim-highlightedyank'

    Plug 'mhinz/vim-signify'
                \ | Plug 'Chiel92/vim-autoformat'
                \ | Plug 'scrooloose/nerdcommenter'
                \ | Plug 'kana/vim-textobj-user'
                \ | Plug 'reedes/vim-wordy'
                \ | Plug 'reedes/vim-textobj-quote'
                \ | Plug 'reedes/vim-textobj-sentence'
                \ | Plug 'reedes/vim-pencil'
                \ | Plug 'reedes/vim-litecorrect'

    Plug 'vim-airline/vim-airline'
          \ | Plug 'vim-airline/vim-airline-themes'

    Plug 'xolox/vim-misc'
                \ | Plug 'xolox/vim-shell'
                \ | Plug 'bpstahlman/txtfmt'
                \ | Plug 'xolox/vim-notes'
                \ | Plug 'godlygeek/tabular'
                \ | Plug 'jceb/vim-orgmode'
                \ | Plug 'mattn/emmet-vim'
                \ | Plug 'henrik/vim-indexed-search'
                \ | Plug 'guns/xterm-color-table.vim'
                \ | Plug 'metakirby5/codi.vim'

    Plug 'flazz/vim-colorschemes'
          \ | Plug 'baskerville/bubblegum'

    Plug 'tmux-plugins/vim-tmux'
                \ | Plug 'tmux-plugins/vim-tmux-focus-events'

    Plug 'vimperator/vimperator.vim'
    Plug 'SyntaxRange'
    Plug 'utl.vim'
    Plug 'mattn/calendar-vim'
    Plug 'fisadev/vim-isort'
    Plug 'heavenshell/vim-pydocstring'
    Plug 'jamessan/vim-gnupg'
    Plug 'hashivim/vim-terraform'
    Plug 'ryanoasis/vim-devicons'

    call g:plug#end()
endfunc

func! plugins#combind() abort
  let g:startify_bookmarks = bm#all_files()
endfunc

func! plugins#open(name) abort
    let l:path = g:jalcine.plugins.dir . "/" . a:name
    exec(":edit " . l:path)
endfunc

func! plugins#bind() abort
    call plugins#configure()
    call plugins#define()
    call plugins#combind()
    filetype plugin indent on
endfunc

func! plugins#reparse() abort
    call plugins#configure()
    call plugins#define()
    :PlugClean
    :PlugInstall
    :PlugUpgrade
    :PlugSnapshot
    :w ${HOME}/.config/nvim/locked-plugin-list.vim
endfunc

func! plugins#install() abort
  :source ${HOME}/.config/nvim/locked-plugin-list.vim
endfunc

command! -complete=dir -nargs=1 OpenPluginDir call plugins#open("<args>")<cr>

func! plugins#configure()
  let g:plug_window = 'botright new | resize 6'
  let g:rooter_use_lcd = 1
  let g:rooter_silent_chdir = 1
  let g:notes_suffix = '.txt'
  let g:sunset_latitude='50'
  let g:sunset_longitude='70'
  let g:vim_json_syntax_conceal = 1
  let g:fzf_command_prefix = 'Fzf'
  let g:fzf_files_options =
        \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'
  " {{{ nerd*
  let g:NERDCreateDefaultMappings = 1
  let g:NERDCompactSexyComs = 1
  let g:NERDSpaceDelims = 1
  let g:NERDRemoveExtraSpaces = 1
  " }}}

  " {{{ ultisnips
  let g:snips_author = 'Jacky Alciné <yo@jacky.wtf>'
  let g:UltiSnipsEnableSnipMate = 1
  let g:UltiSnipsUsePythonVersion = 2
  let g:UltiSnipsEditSplit = 'context'
  let g:UltiSnipsSnippetDirectories = [$HOME. '/.config/nvim/snippets']
  " }}}

  " {{{ vim-bookmarks
  let g:bookmark_sign = '♥'
  let g:bookmark_highlight_lines = 1
  " "}}

  " {{{ ag
  let g:ag_prg="ag --vimgrep --smart-case --noheading"
  let g:ag_highlight=1
  " }}}

  let g:neomake_list_height = 3
  let g:neomake_open_list = 0
  let g:neomake_serialize = 1
  let g:neomake_serialize_abort_on_error = 1
  let g:neomake_verbose = 1
  let g:neomake_javascript_enabled_checkers = ['eslint']
  let g:neomake_python_enabled_checkers = ['python', 'flake8']
  let g:neomake_scss_enabled_checkers = ['scss-lint']
  let g:neomake_sh_enabled_checkers = ['shellcheck']
  let g:neomake_ruby_enabled_checkers = ['rubocop', 'mri']
  let g:neomake_vim_enabled_checkers = ['vint']
  let g:neomake_elixir_enabled_checkers = ['mix', 'credo']
  let g:airline#extensions#hunks#non_zero_only = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_splits = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#whitespace#enabled = 1
  let g:airline#extensions#whitespace#mixed_indent_algo = 1
  let g:airline#extensions#whitespace#show_message = 1
  let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
  let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
  let g:airline#extensions#tagbar#flags = 'f'
  let g:airline_theme = 'serene'
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
  let s:custom_header =
        \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

  func! s:filter_header(lines) abort
    let l:longest_line = max(map(copy(a:lines), 'len(v:val)'))
    let l:centered_lines= map(copy(a:lines),
          \ 'repeat(" ", (&columns / 2) - (l:longest_line / 2)) . v:val')
    return l:centered_lines
  endfunc


  let g:startify_custom_header = s:filter_header(s:custom_header)
  let g:startify_files_number = 5
  let g:startify_change_to_dir = 0
  let g:startify_change_to_vcs_root = 0
  let g:startify_relative_path = 1
  let g:startify_bookmarks = [ '~/.config/nvim/init.vim', '~/.bashrc', '~/prjs' ]
  let g:startify_session_dir = '~/.config/nvim/sessions'

  let g:localvimrc_persistent = 1
  let g:EditorConfig_max_line_indicator = "line"

  let g:easytags_async = 1
  let g:easytags_file = '~/.vimtags'
  let g:easytags_resolve_links = 1
  let g:easytags_by_filetype = 1
  let g:easytags_dynamic_files = 1
  let g:easytags_include_members = 1
  let g:easytags_languages = {
        \ 'javascript': {
        \   'cmd': 'jsctags',
        \   'args': [],
        \   'fileoutput_opt': '-f',
        \   'stdout_opt': '-f-',
        \   'recurse_flag': '-R'
        \   }
        \ }

  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_color_change_percent = 2
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify', 'tagbar']


  let g:tagbar_left=0
  let g:tagbar_compact=1
  let g:tagbar_autofocus=1
  let g:tagbar_autoclose=0
  let g:tagbar_iconchars = ['+', '-']
  let g:tagbar_autoshowtag = 1
  let g:tagbar_width=40

  let g:tagbar_type_elixir = {
        \ 'ctagstype': 'elixir',
        \ 'kinds': [
        \ 'f:functions:0:0',
        \ 'c:callbacks:0:0',
        \ 'd:delegates:0:0',
        \ 'e:exceptions:0:0',
        \ 'i:implementations:0:0',
        \ 'a:macros:0:0',
        \ 'o:operators:0:0',
        \ 'm:modules:0:0',
        \ 'p:protocols:0:0',
        \ 'r:records:0:0'
        \ ],
        \ 'sro': '.',
        \ 'kind2scope': {'m': 'modules'},
        \ 'scope2kind': {'modules': 'm'}
        \ }

endfunc

func! plugins#define()
  call g:plug#begin(g:jalcine.plugins.dir)
  Plug 'tpope/vim-sensible'
  Plug 'rking/ag.vim'

  Plug 'SirVer/ultisnips'
        \ | Plug 'honza/vim-snippets'
  Plug 'editorconfig/editorconfig-vim'
        \ | Plug 'bogado/file-line'
        \ | Plug 'airblade/vim-rooter'
        \ | Plug 'embear/vim-localvimrc'
        \ | Plug 'Konfekt/FastFold'

  Plug 'heavenshell/vim-jsdoc'
        \ | Plug 'KabbAmine/zeavim.vim'

  Plug 'benekastah/neomake'
        \ | Plug 'janko-m/vim-test'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        \ |  Plug 'junegunn/fzf.vim'

  Plug 'junegunn/goyo.vim'
        \ | Plug 'junegunn/limelight.vim'
        \ | Plug 'junegunn/vim-easy-align'

  Plug 'koron/minimap-vim'
  Plug 'majutsushi/tagbar' | Plug 'TagHighlight'
  Plug 'mattesgroeger/vim-bookmarks'

  Plug 'mattn/webapi-vim'
        \ | Plug 'mattn/gist-vim', { 'on': 'Gist' }

  Plug 'mhinz/vim-startify'
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable', 'on': 'YcmGenerateConfig' }
  Plug 'sheerun/vim-polyglot'
        \ | Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

  Plug 'terryma/vim-multiple-cursors'
        \ | Plug 'nathanaelkane/vim-indent-guides'
        \ | Plug 'tpope/vim-endwise'
        \ | Plug 'tpope/vim-jdaddy', { 'for': 'json' }
        \ | Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
        \ | Plug 'tpope/vim-repeat'
        \ | Plug 'tpope/vim-rhubarb'
        \ | Plug 'tpope/vim-rsi'
        \ | Plug 'tpope/vim-speeddating'
        \ | Plug 'tpope/vim-surround'
        \ | Plug 'tpope/vim-vinegar'
        \ | Plug 'tpope/vim-fugitive'
        \ | Plug 'tpope/vim-dispatch'
        \ | Plug 'radenling/vim-dispatch-neovim'

  Plug 'mhinz/vim-signify'
        \ | Plug 'Chiel92/vim-autoformat'
        \ | Plug 'scrooloose/nerdcommenter'
        \ | Plug 'reedes/vim-wordy'

  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        \ | Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on':  'NERDTreeToggle' }
        \ | Plug 'low-ghost/nerdtree-fugitive', { 'on':  'NERDTreeToggle' }
        \ | Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
        \ | Plug 'jistr/vim-nerdtree-tabs'

  Plug 'vim-airline/vim-airline'
        \ | Plug 'vim-airline/vim-airline-themes'

  Plug 'xolox/vim-misc'
        \ | Plug 'xolox/vim-shell'
        \ | Plug 'bpstahlman/txtfmt'
        \ | Plug 'xolox/vim-easytags'
        \ | Plug 'xolox/vim-notes'
        \ | Plug 'jceb/vim-orgmode'

  Plug 'Sunset'
        \ | Plug 'w0ng/vim-hybrid'

  Plug 'tmux-plugins/vim-tmux'
        \ | Plug 'tmux-plugins/vim-tmux-focus-events'

  Plug 'vimperator/vimperator.vim'
  Plug 'SyntaxRange'
  Plug 'utl.vim'
  Plug 'mattn/calendar-vim'

  Plug 'ryanoasis/vim-devicons'
  call g:plug#end()
endfunc

func! plugins#open(name)
  let l:path = g:jalcine.plugins.dir . "/" . a:name
  exec(":edit " . l:path)
endfunc

func! plugins#bind()
  call plugins#configure()
  call plugins#define()
  filetype plugin indent on
endfunc

command! -complete=dir -nargs=1 OpenPluginDir call plugins#open("<args>")<cr>

" File:          init.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Entry point of all of my configuration.
" Last Modified: August 08, 2017
"
" This is where I tell Neovim to do my bidding. Yes, I have over
" 100+ plugins. No, Neovim does not run slow.
"
" vim: set fdm=syntax foldlevel=0 :

set encoding=UTF-8 fileencoding=UTF-8
set hidden
scriptencoding UTF-8

let vimrc_root = fnamemodify($MYVIMRC, ':p:h')
exec "let $PATH=\"" . vimrc_root . "/node_modules/.bin:\" . $PATH"

iabbrev myemail yo@jacky.wtf
iabbrev myname Jacky Alciné
iabbrev me_fname Jacky
iabbrev me_lname Alciné
iabbrev me_site https://jacky.wtf

" {{{ local funcs
func! s:terminal_kill_extra_buffers() abort
  silent! cclose
  silent! lclose
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
call plug#begin(expand('$HOME/.config/nvim/plugged'))

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-scriptease'
Plug 'janko-m/vim-test'
Plug 'wsdjeg/vim-fetch'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-dotenv'
      \ | Plug 'direnv/direnv.vim'
      \ | Plug 'wincent/terminus'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
      \ | Plug 'tpope/vim-rhubarb'
      \ | Plug 'int3/vim-extradite'
      \ | Plug 'tommcdo/vim-fubitive'
      \ | Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'junkblocker/patchreview-vim' | Plug 'codegram/vim-codereview'
Plug 'chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'vim-scripts/SyntaxRange'
" Plug 'arakashic/chromatica.nvim'
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
      \ | Plug 'junegunn/fzf.vim'
      \ | Plug 'fszymanski/fzf-gitignore', { 'do' : ':UpdateRemotePlugins' }
Plug 'KabbAmine/zeavim.vim'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-scripts/dbext.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ryanoasis/vim-devicons'
Plug 'chriskempson/base16-vim'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'sodapopcan/vim-twiggy'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'vrybas/vim-flayouts'
Plug 'meain/vim-package-info', { 'do': 'npm install' }
Plug 'brooth/far.vim'
Plug 'Shougo/echodoc.vim'
" Plug 'jiangmiao/auto-pairs'
Plug 'heavenshell/vim-jsdoc'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --force-enable-node --force-enable-chrome --force-enable-php'}
Plug 'mattn/emmet-vim'

Plug 'ncm2/ncm2'
      \ | Plug 'roxma/nvim-yarp'
      \ | Plug 'ncm2/ncm2-bufword'
      \ | Plug 'ncm2/ncm2-path'
      \ | Plug 'ncm2/ncm2-tmux'
      \ | Plug 'ncm2/ncm2-cssomni'
      \ | Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
      \ | Plug 'ncm2/ncm2-tagprefix'
      \ | Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
      \ | Plug 'ncm2/ncm2-ultisnips'
      \ | Plug 'ncm2/ncm2-racer', { 'do': 'cargo +nightly install racer && rustup component add rls rust-analysis rust-src' }
      \ | Plug 'JakeBecker/elixir-ls', {'do': 'mix clean && mix deps.get && mix compile && mix elixir_ls.release -o ' . vimrc_root . '/bin'}
      \ | Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
      \ | Plug 'ekalinin/dockerfile.vim'
      " \ | Plug 'bfrg/vim-cpp-modern'
      " \ | Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

call plug#end()
" }}}

" {{{ settings
" These are core options for Neovim. A lot of these help me use Neovim in a
" semi-intuitive fashion for me.
"
if has('termguicolors') " {{{2 Improve terminal colors
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif " 2}}}

" Always show a statusline.
set laststatus=2
"
" Allow myself to count what line I'm on; optimized for scanning and jumping
" over multiple lines quickly.
set number numberwidth=5
set relativenumber
set sidescrolloff=1 sidescroll=1
set conceallevel=3 concealcursor=nivc

" Fold options {{{2
" set nofoldenable
set foldmethod=syntax foldlevel=2 foldcolumn=2 foldminlines=5
"2}}}
set wrap wrapmargin=2
set linebreak
set pumheight=5
set showmode showmatch
set lazyredraw redrawtime=3000
set spelllang=en_us
set inccommand=nosplit

set completeopt=menu,menuone,preview,noselect,noinsert

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
set backup writebackup
set undodir=$HOME/.config/nvim/undo
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
set showfulltag noshowmatch
" }}}


" {{{ Options
"
" {{{2 fzf
let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'

function! FloatingFZF()
  let width = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.6)
  let opts = { 'relative': 'editor',
              \ 'row': (&lines - height) / 2,
              \ 'col': (&columns - width) / 2,
              \ 'width': width,
              \ 'height': height }

  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" }}}
" {{{2 vim-bookmarks
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
" }}}
"
" {{{2 signify
let g:signify_vcs_list = [ 'git', 'hg', 'bzr' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 1
let g:signify_line_highlight = 0
" 2}}}
" {{{2 twiggy
let g:twiggy_enable_remote_delete = 1
let g:echodoc#enable_at_startup = 0
let g:echodoc#type = 'signature'
" 2}}}
" {{{2
let g:git_messenger_always_into_popup = v:true
" }}}
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

if executable('ripgrep')
  let $FZF_DEFAULT_COMMAND = 'ag --silent --hidden'
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif
" }}}
" {{{2
" }}}
let g:autoformat_remove_trailing_spaces = 1
" {{{2 ale
let g:ale_command_wrapper = 'nice -n8'
let g:ale_set_ballons = 1
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_rust_cargo_check_tests = 1
let g:ale_virtualtext_cursor = 0
let g:ale_completion_enabled = 0
let g:ale_use_global_executables = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_fixers = {
      \ '*' : ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'vue': ['eslint', 'prettier'],
      \ 'scss': ['stylelint', 'prettier'],
      \ 'html': ['stylelint', 'prettier', 'tidy'],
      \ 'rust': ['rustfmt'],
      \ 'elixir': ['mix_format'],
      \ 'json': ['jq']
      \ }
let g:ale_linters = {
      \ 'rust': ['rustc', 'clippy', 'cargo'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'javascript':  ['eslint', 'prettier'],
      \ 'json': ['jq'],
      \ 'elixir': ['credo', 'mix']
      \ }
" 2}}}
"
let g:vim_jsx_pretty_template_tags = []
"
let g:vimspector_enable_mappings = 'HUMAN'
let g:racer_experimental_completer = 0
let g:racer_insert_paren = 1

" {{{2 vim-test
let g:test#custom_transformations = {
      \ 'vagrant': function('<SID>VagrantTransform'),
      \ 'docker': function('<SID>DockerTransform'),
      \ 'docker-compose': function('<SID>DockerComposeTransform')
      \}
" 2}}}
"
" {{{2 Zeavim
let g:zv_file_types = {
      \ 'eelixir': 'html,elixir,erlang',
      \ 'elixir': 'elixir,erlang',
      \ 'sass': 'scss,css',
      \ 'typescript': 'typescript,javascript,html'
      \ }
let g:zv_get_docset_by = ['ft', 'file', 'ext']
let g:vimspector_enable_mappings = 'HUMAN'
" }}}
"
" {{{2 gutentags
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_auto_set_tags = 1
let g:gutentags_cache_dir = vimrc_root . '/tags'
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
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1
let g:rooter_patterns = [
      \ 'mix.lock',
      \ 'package-lock.json',
      \ '.git/',
      \ '*file',
      \ ]

let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

let g:ncm2_look_enabled = 1
let g:float_preview#docked = 1
"
" {{{2
let g:test#strategy = 'neovim'
let g:test#neovim#term_position = "leftabove"
" }}}
"
" {{{2 localvimrc
let g:localvimrc_sandbox = 1
let g:localvimrc_persistent = 1
let g:localvimrc_persistent_file = expand('$HOME/.config/nvim/localvimrc_persistent')
let g:localvimrc_whitelist = [expand('$HOME/.lvimrc')]
" 2}}}
"
" {{{2
let g:far#collapse_result = 1
let g:far#auto_write_replaced_buffers = 1
let g:far#auto_delete_replaced_buffers = 1
" }}}
"
" {{{2 airline
let g:airline_powerline_fonts = 1
let g:airline#theme = 'base16'
let g:airline_skip_empty_sections = 1
let g:airline_extensions = ['branch', 'tabline', 'ale', 'branch', 'hunks']
let g:airline_highlighting_cache = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#displyed_head_limit = 100
let g:airline#extensions#branch#format = 2
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#quickfix#location_text = 'L'
let g:airline#extensions#quickfix#quickfix_text = 'Q'
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
" }}}
"
" {{{2 langserver
let g:LanguageClient_waitOutputTimeout = 0
let g:LanguageClient_completionPreferTextEdit = 1
let g:LanguageClient_windowLogMessageLevel = 'Log'
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile = expand('$HOME/.config/nvim/language-client.log')
let g:LanguageClient_trace = "verbose"
let g:LanguageClient_settingsPath = expand('$HOME/.config/nvim/language_client.json')
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'python': ['pyls'],
      \ 'rust': ['rls'],
      \ 'elixir': ['bash', vimrc_root . '/bin/language_server.sh'],
      \ 'vim': ['vim-language-server', '--stdio']
      \ }
let g:LanguageClient_rootMarkers = {
      \ 'javascript': ['package.json', 'jsconfig.json'],
      \ 'typescript': ['tsconfig.json', 'tslint.json'],
      \ 'elixir': ['mix.exs'],
      \ 'rust': ['Cargo.toml']
      \ }
"}}}

" {{{ Mappings
let s:mappings = {
      \ 'leader':  ',',
      \ 'localLeader':  '\\',
      \ }
exec 'let g:mapleader="' . s:mappings.leader . '"'
exec 'let g:maplocalleader="' . s:mappings.localLeader. '"'

nnoremap <silent> <F9> :Dispatch<CR>

call <SID>apply_bulk_mappings([
      \ ['t', ':TestNearest<CR>'],
      \ ['f', ':TestFile<CR>'],
      \ ['a', ':TestSuite<CR>'],
      \ ['l', ':TestLast<CR>'],
      \ ['v', ':TestVisit<CR>'],
      \ ], { 'prefix' : 't' })

call <SID>apply_bulk_mappings([
      \ ['i', ':Make install<CR>'],
      \ ['b', ':Make build<CR>'],
      \ ['c', ':Make clean<CR>'],
      \ ['<space>', ':Make!<space>'],
      \ ], { 'prefix' : 'm' })


call <SID>apply_bulk_mappings([
      \ ['b', ':Buffers<cr>'],
      \ ['c', ':Commits<cr>'],
      \ ['f', ':Files<cr>'],
      \ ['fg?', ':GFiles?<cr>'],
      \ ['fg', ':GFiles<cr>'],
      \ ['h', ':History<cr>'],
      \ ['H', ':Helptags<cr>'],
      \ ['mc', ':call fzf#vim#maps("c", 1)<cr>'],
      \ ['mi', ':call fzf#vim#maps("i", 1)<cr>'],
      \ ['mn', ':call fzf#vim#maps("n", 1)<cr>'],
      \ ['mt', ':call fzf#vim#maps("t", 1)<cr>'],
      \ ['mv', ':call fzf#vim#maps("v", 1)<cr>'],
      \ ['s', ':Snippets<cr>'],
      \ ['t', ':Tags<cr>'],
      \ ['w', ':Windows<cr>']
      \ ], { 'prefix': 's' })

call <SID>apply_bulk_mappings([
      \ ['C', ':Gcommit --branch --verbose %<CR>'],
      \ ['P', ':Gpush<CR>'],
      \ ['S', ':Glc<CR>'],
      \ ['b', ':Gbrowse<CR>'],
      \ ['c', ':Gcommit<CR>'],
      \ ['C', ':Glc<CR>'],
      \ ['cO', ':Git checkout HEAD -- %<CR>'],
      \ ['co', ':Git checkout<space>'],
      \ ['e', ':Extradite<CR>'],
      \ ['f', ':Git fetch<space>'],
      \ ['fa', ':Git fetch --all<CR>'],
      \ ['d', ':Git diff --cached<CR>'],
      \ ['d!', ':Git diff<CR>'],
      \ ['l', ':Gpull<CR>'],
      \ ['mr', ':GlpullRequestSummaryTab'],
      \ ['p', ':Gpush<space>'],
      \ ['r', ':Gpush dokku HEAD:master --no-verify'],
      \ ['R', ':Gpush dokku HEAD:master --no-verify --force-with-lease'],
      \ ['rc', ':GlresolveConflictTab'],
      \ ['rm', ':Gremove %<CR>'],
      \ ['rmc', ':Gremove --cached %<CR>'],
      \ ['sd', ':SignifyDebug<CR>'],
      \ ['sh', ':SignifyToggleHighlight<CR>'],
      \ ['sj', '<plug>(signify-next-hunk)'],
      \ ['sk', '<plug>(signify-prev-hunk)'],
      \ ['sr', ':SignifyRefresh<CR>'],
      \ ['st', ':SignifyToggle<CR>'],
      \ ['t', ':Twiggy<CR>'],
      \ ['x', ':Glabort<CR>'],
      \ ['w', ':Glwrite<CR>'],
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
      \ ['c', ':call LanguageClient_contextMenu()<CR>'],
      \ ['D', ':call LanguageClient#textDocument_typeDefinition()<CR>'],
      \ ['i', ':call LanguageClient#textDocument_implementation()<CR>'],
      \ ['f', ':call LanguageClient#textDocument_references()<CR>'],
      \ ['a', ':call LanguageClient#textDocument_codeAction()<CR>'],
      \ ], { 'prefix': 'lc'})

function! s:LC_maps() abort
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    nnoremap <buffer> <silent> <Space><Space> :call <SID>LC_restart()<CR>
  endif
endfunction

function! s:LC_restart() abort
  :echo LanguageClient#exit()
  :echo LanguageClient#startServer()
endfunction

autocmd FileType * call s:LC_maps()

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> ;; @:

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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>
inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>

nnoremap <Space><Space> call s:launch_omniselect()<CR>

function! s:launch_omniselect()
  call fzf#complete()
endfunction

" }}}


if !exists('$KONSOLE_VERSION')
  " As a work around for the following bugs in kde4's konsole:
  "   use the output of 16.colorscheme.rb and don't set base16colorspace.
  "   base-shell script will not be called
  " https://github.com/chriskempson/base16-shell/issues/31
  " https://bugs.kde.org/show_bug.cgi?id=344181
  let base16colorspace=256
endif

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

filetype plugin indent on
syntax on

autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd BufNewFile,BufRead * inoremap <silent> <buffer> <expr> <cr> ncm2_ultisnips#expand_or("\<CR>", 'n')
autocmd FileType gitcommit set bufhidden=delete
autocmd TermOpen * setl nonumber noruler norelativenumber signcolumn=no foldcolumn=0 bufhidden=delete
autocmd TextChangedI * call ncm2#auto_trigger()
autocmd User Ncm2PopupClose set completeopt=menuone
autocmd User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
autocmd User LanguageClientStopped :echo LanguageClient#startServer()

command! DisconnectClients
     \  if exists('b:nvr')
     \|   for client in b:nvr
     \|     silent! call rpcnotify(client, 'Exit', 1)
     \|   endfor
     \| endif

command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

sign define vimspectorBP text=🔴 texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

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
set number numberwidth=3
set relativenumber
set sidescrolloff=1 sidescroll=1
set conceallevel=3 concealcursor=nivc

" Fold options {{{2
set foldenable
set foldminlines=10
set foldmethod=syntax
set foldlevel=3
" 2}}}
set wrap wrapmargin=2
set linebreak
set shortmess+=c
set hidden
set pumheight=5
set noshowmode noshowmatch
set lazyredraw
set spelllang=en_us
set inccommand=nosplit
set maxmempattern=8196

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
set nocscopetag
set showfulltag showmatch
" }}}

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
call plug#begin(expand('$HOME/.config/nvim/plugins'))

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-scriptease'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dotenv'
      \ | Plug 'direnv/direnv.vim'
      \ | Plug 'wincent/terminus'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
      \ | Plug 'cbaumhardt/vim-commentary-boxed'
Plug 'tpope/vim-fugitive'
      \ | Plug 'tpope/vim-rhubarb'
      \ | Plug 'int3/vim-extradite'
      \ | Plug 'tommcdo/vim-fubitive'
      \ | Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'bfrg/vim-cpp-modern', { 'for': 'c++,c' }
Plug 'junkblocker/patchreview-vim'
Plug 'codegram/vim-codereview'
Plug 'chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'vim-scripts/SyntaxRange'
Plug 'arakashic/chromatica.nvim', {'for': ['cpp', 'c'] }
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
      \ | Plug 'junegunn/fzf.vim'
      \ | Plug 'fszymanski/fzf-gitignore', { 'do' : ':UpdateRemotePlugins' }
Plug 'KabbAmine/zeavim.vim'
Plug 'vim-airline/vim-airline' |
      \ Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-rooter'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
      \ |  Plug 'honza/vim-snippets'
Plug 'vim-scripts/dbext.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'chriskempson/base16-vim'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'sodapopcan/vim-twiggy'
Plug 'junegunn/gv.vim'
Plug 'vrybas/vim-flayouts'
Plug 'ekalinin/dockerfile.vim'

Plug 'ncm2/ncm2'
      \ | Plug 'ncm2/ncm2-bufword'
      \ | Plug 'ncm2/ncm2-path'
      \ | Plug 'ncm2/ncm2-tmux'
      \ | Plug 'ncm2/ncm2-cssomni'
      \ | Plug 'ncm2/ncm2-racer'
      \ | Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
      \ | Plug 'pbogut/ncm2-alchemist' | Plug 'slashmili/alchemist.vim'
      \ | Plug 'ncm2/ncm2-ultisnips'
      \ | Plug 'roxma/nvim-yarp'

call plug#end()
" }}}

" {{{ Options
" {{{2 vim-bookmarks
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
" }}}
"
" {{{2 signify
let g:signify_vcs_list = [ 'git', 'hg', 'bzr' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_line_highlight = 0
" 2}}}
" {{{2 twiggy
let g:twiggy_enable_remote_delete = 1
" 2}}}

if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" }}}
"
" {{{2 ale
let g:ale_command_wrapper = 'nice -n4'
let g:ale_set_ballons = 1
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_completion_delay = 1
let g:ale_completion_max_suggestions = 10
let g:ale_fixers = {
      \ '*' : ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'vue': ['prettier'],
      \ 'scss': ['stylelint'],
      \ 'html': ['stylelint', 'tidy'],
      \ 'rust': ['rustfmt'],
      \ 'elixir': ['mix_format'],
      \ }
let g:ale_linters  = {
      \ 'elixir': 'all'
      \ }
" 2}}}
"
" {{{2 vim-test
let g:test#custom_transformations = {
      \ 'vagrant': function('<SID>VagrantTransform'),
      \ 'docker': function('<SID>DockerTransform'),
      \ 'docker-compose': function('<SID>DockerComposeTransform')
      \}
let g:test#preserve_screen = 1
" 2}}}
"
"
" {{{2 gutentags
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_tagfile = '.tags'
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
" {{{2 startify
let g:startify_list_order = ['commands', 'sessions', 'bookmarks', 'files', 'dir']
let g:startify_files_number = 15
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
      \ { 'header': ['   Vim Config Edits'],        'type': function('s:list_commits') },
      \ { 'header': ['   Bookmarks'],      'type': 'bookmarks' },
      \ { 'header': ['   Commands'],       'type': 'commands' },
      \ ]
let g:startify_session_before_save = [
      \ 'silent! s:terminal_kill_extra_buffers()'
      \ ]
" 2}}}
"
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger  = "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
"
" {{{2
let g:test#strategy = 'neovim'
let g:test#neovim#term_position = "topleft"
" }}}
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
let g:airline_extensions = ['branch', 'tabline', 'ale', 'branch', 'hunks', 'cursormode']
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

" {{{ Mappings
let s:mappings = {
      \ 'leader':  ',',
      \ 'localLeader':  '\\',
      \ }
exec 'let g:mapleader="' . s:mappings.leader . '"'
exec 'let g:maplocalleader="' . s:mappings.localLeader. '"'

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
      \ ['S', ':Glc<CR>'],
      \ ['b', ':Gbrowse<CR>'],
      \ ['c', ':Gcommit<CR>'],
      \ ['cO', ':Git checkout HEAD -- %<CR>'],
      \ ['co', ':Git checkout<space>'],
      \ ['e', ':Extradite<CR>'],
      \ ['f', ':Git fetch<space>'],
      \ ['fa', ':Git fetch --all<CR>'],
      \ ['l', ':Gpull<CR>'],
      \ ['mr', ':GlpullRequestSummaryTab'],
      \ ['p', ':Gpush<space>'],
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
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

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

" }}}

source ~/.vimrc_background

filetype plugin indent on
syntax on

autocmd FileType gitcommit set bufhidden=delete
autocmd FileType fugitive setl winheight=40
autocmd TermOpen * setl nonumber signcolumn=no foldcolumn=0
autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
autocmd User Ncm2PopupClose set completeopt=menuone

function! Multiple_cursors_before()
  call ncm2#lock('vim-multiple-cursors')
endfunction

function! Multiple_cursors_after()
  call ncm2#unlock('vim-multiple-cursors')
endfunction


command! DisconnectClients
      \  if exists('b:nvr')
      \|   for client in b:nvr
        \|     silent! call rpcnotify(client, 'Exit', 1)
        \|   endfor
        \| endif

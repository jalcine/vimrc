" vim: set fdm=marker foldenable foldlevel=0 nospell:
" File:          .nvimrc
" Author:        Jacky Alciné <yo@jacky.wtf>
" Description:   The heart for Neovim.
" Last Modified: 2015-01-03 15:51:04 EST
"
" This is my personal setup for NeoVim. It works ~exactly~ the
" way I expect it to. Any different would trip me up.

set laststatus=2
set number relativenumber
syntax on

" {{{ abbreviations
" {{{ Identifiers
iabbrev me_email yo@jacky.wtf
iabbrev me_name Jacky Alciné
iabbrev me_fname Jacky
iabbrev me_lname Alciné
iabbrev me_site https://jacky.wtf
" }}}
" {{{ Constant Typos
iabbrev fucntion function
iabbrev sesssion session
iabbrev existant existent
iabbrev existance existence
iabbrev inlcude include
iabbrev conifg config
" }}}
" {{{ Lingo
iabbrev afaik as far as I know
iabbrev tbh to be honest
iabbrev afaics as far as I can see
iabbrev lgtm looks good to me
" }}}
" {{{ Sites
iabbrev bko bugs.kde.org
iabbrev bmo bugs.mozilla.org
iabbrev blp launchpad.net
" }}}
" {{{ Projects
iabbrev ggl google
iabbrev ghb github
iabbrev glb gitlab
iabbrev lnx linux
iabbrev wntr wintermute
iabbrev Wntr Wintermute
" }}}
" }}}

" {{{ Plugin Options

" {{{ vim-airline options
let g:airline_theme = 'ubaryd'
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'B'
      \ }
" }}}

" {{{ unite options
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = '~/.vim/cache-unite'
let g:unite_source_rec_max_cache_files = 1000
let g:unite_source_grep_max_candidates = 500
let g:unite_enable_start_insert = 1
" }}}

" {{{ nerd*
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDCreateDefaultMappings = 1
let g:NERDCompactSexyComs = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeShowBookmarks = 1
" }}}

" {{{ ultisnips
let g:snips_author = 'Jacky Alciné <yo@jacky.wtf>'
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsEditSplit = 'context'
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories = ['Ultisnips']
" }}}

" }}}

" {{{ Plugin Managers

" Set up vim-plug ▶️ https://github.com/junegunn/vim-plug#example

call plug#begin('~/.nvim/plugins')

Plug 'benekastah/neomake'
Plug 'bruno-/vim-man', { 'on': 'Man' }
Plug 'janko-m/vim-test'
Plug 'bling/vim-airline'

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'scrooloose/nerdcommenter', { 'on': 'NERDComment' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

" Code to execute when the plugin is loaded on demand
Plug 'Valloric/YouCompleteMe', { 'for': 'cpp' }
autocmd! User YouCompleteMe call youcompleteme#Enable(

call plug#end()

" }}}

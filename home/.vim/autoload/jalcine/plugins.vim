" File: jalcine/plugins.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Logic to control the use of plug-ins in Vim.

" Function: jalcine#plugins#setup
" Brief:    Wrapper function for this script.
func! jalcine#plugins#setup()
  call jalcine#plugins#prep()
  call jalcine#plugins#load()
  call jalcine#plugins#set_options()
  call jalcine#mappings#apply('plugin')
endfunction

" Function: jalcine#plugins#prep
" Brief:    Checks prerequisities for my plug-in system.
func! jalcine#plugins#prep()
  " TODO: Add a check for ag.
  " TODO: Add a check for git.
  let vundle_readme=expand('$HOME/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    call jalcine#plugins#install_vundle()
  endif
endfunc

" Function: jalcine#plugins#install_vundle
" Brief:    Downloads, installs and configures Vundle. YAY!
" URL: https://web.archive.org/web/20130127003932/http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
func jalcine#plugins#install_vundle()
  let iCanHazVundle=1
  echo "[jalcine.vim] Vundle not found, installing...\n"
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone git://github.com/jalcine/vundle $HOME/.vim/bundle/vundle
  echo "[jalcine.vim] Installing plugins...\n"
  call jalcine#plugins#load()
  :BundleInstall!
  echo "[jalcine.vim] Building native extensions..\n"
  silent !cd $HOME/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer --omnisharp-completer --system-libclang
  silent !cd $HOME/.vim/bundle/vimproc.vim && make
  echo "[jalcine.vim] Thanks for flying Vim, come again.\n"
endfunction

" Function: jalcine#plugins#load()
" Brief:    Loads the plugins I'd use into Vim.
function! jalcine#plugins#load()
  filetype off
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
  
  " {{{ Utilities and Core
  Bundle 'gmarik/vundle'
  Bundle 'xolox/vim-misc'
  Bundle 'mattn/webapi-vim'
  Bundle 'bling/vim-airline'
  Bundle 'xolox/vim-session'
  Bundle 'Shougo/vimproc.vim'
  Bundle 'editorconfig/editorconfig-vim'
  Bundle 'aaronbieber/quicktask'
  Bundle 'jalcine/localrc.vim'
  " }}}

  " {{{ Tags
  Bundle 'majutsushi/tagbar'
  Bundle 't4ku/marktag'
  " }}}

  " {{{ Version Control
  Bundle 'int3/vim-extradite'
  Bundle 'mhinz/vim-signify'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-git'
  " }}} 

  " {{{ Autocompletion
  Bundle 'Raimondi/delimitMate'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-speeddating'
  Bundle 'tpope/vim-abolish'
  Bundle 'Valloric/YouCompleteMe'
  Bundle 'Chiel92/vim-autoformat'
  Bundle 'marijnh/tern_for_vim'
  " }}}

  " {{{ Multiplexing and Control
  Bundle 'benmills/vimux'
  Bundle 'jalcine/vim-tmux'

  Bundle 'tpope/vim-dispatch'
  Bundle 'terryma/vim-multiple-cursors'
  " }}}

  " {{{ Color
  Bundle 'godlygeek/csapprox'
  Bundle 'Rykka/colorv.vim'
  Bundle 'guns/xterm-color-table.vim'
  " }}}

  " {{{ Color Schemes
  "Bundle 'altercation/solarized',       { 'rtp' : 'vim-colors-solarized' }
  "Bundle 'flazz/vim-colorschemes'
  "Bundle 'daylerees/colour-schemes',    { 'rtp' : 'vim-themes' }
  Bundle 'chriskempson/tomorrow-theme', { 'rtp' : 'vim' }
  Bundle 'nanotech/jellybeans.vim'
  Bundle 'tomasr/molokai'
  Bundle 'jnurmine/Zenburn'
  Bundle 'Lokaltog/vim-distinguished'
  Bundle 'jonathanfilip/vim-lucius'
  " }}}

  " {{{ Utilities
  Bundle 'godlygeek/tabular'
  Bundle 'jamessan/vim-gnupg'
  Bundle 'g3orge/vim-voogle'
  Bundle 'tpope/vim-eunuch'
  Bundle 'dbext.vim'
  Bundle 'rking/ag.vim'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  " }}}

  " {{{ "IDE"-like Utilities
  Bundle 'scrooloose/nerdtree'
  Bundle 'jistr/vim-nerdtree-tabs'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'jlanzarotta/bufexplorer'
  Bundle 'SirVer/ultisnips'
  Bundle 'jalcine/vim-snippets'
  Bundle 'scrooloose/syntastic'
  Bundle 'jalcine/cmake.vim'
  "Bundle 'jalcine/android.vim'
  " }}}

  " {{{ Unite & Friends
  Bundle 'Shougo/unite.vim'
  Bundle 'yuku-t/unite-git'
  Bundle 'zepto/unite-tmux'
  Bundle 'jalcine/unite-tag'
  Bundle 'tsukkee/unite-tag'
  Bundle 'basyura/unite-rails'
  Bundle 'pasela/unite-webcolorname'
  " }}}

  " {{{ Language and File Support 
  Bundle 'justinmk/vim-syntax-extra'
  Bundle 'jamessan/vim-gnupg'
  " }}}

  Bundle 'rdolgushin/gitignore.vim'
  Bundle 'mattn/gist-vim'
  Bundle 'gmarik/github-search.vim'
  Bundle 'junegunn/vim-github-dashboard'
  Bundle 'mmozuras/vim-github-comment'
  Bundle 'jaxbot/github-issues.vim'

  Bundle 'pangloss/vim-javascript'
  Bundle 'mklabs/vim-backbone'
  Bundle 'AndrewRadev/vim-eco'
  Bundle 'othree/javascript-libraries-syntax.vim'
  Bundle 'elzr/vim-json'
  Bundle 'kchmck/vim-coffee-script'

  Bundle 'moll/vim-node'
  Bundle 'mklabs/grunt.vim'
  Bundle 'groenewege/vim-less'

  Bundle 'jnwhiteh/vim-golang'

  Bundle 'StanAngeloff/php.vim'
  Bundle 'rayburgemeestre/phpfolding.vim'
  Bundle 'vim-php/tagbar-phpctags.vim'

  Bundle 'shawncplus/phpcomplete.vim'

  Bundle 'indenthtml.vim'
  Bundle 'othree/html5.vim'
  Bundle 'tpope/vim-haml'
  Bundle 'tpope/vim-markdown'
  "Bundle 'digitaltoad/vim-jade'

  Bundle 'mutewinter/vim-css3-syntax'
  Bundle 'ap/vim-css-color'

  Bundle 'vim-ruby/vim-ruby'
  Bundle 'ecomba/vim-ruby-refactoring'
  Bundle 'astashov/vim-ruby-debugger'
  Bundle 'tpope/vim-bundler'
  Bundle 'tpope/vim-rbenv'
  Bundle 'tpope/vim-rails'
  Bundle 'tpope/vim-rake'
  Bundle 'hallison/vim-rdoc'

  Bundle 'klen/python-mode'
  Bundle 'davidhalter/jedi-vim'
  Bundle 'jmcantrell/vim-virtualenv'

  Bundle 'mutewinter/nginx.vim'

  Bundle 'vim-perl/vim-perl'
  Bundle 'derekwyatt/vim-scala'

  filetype plugin indent on
  syntax on
endfunction

" Function: jalcine#plugins#set_options
" Brief:    Set options for the plug-ins.
func! jalcine#plugins#set_options()
  let g:author='Jacky Alciné'
  let g:email='me@jalcine.me'
  let g:site='jalcine.me'
  let g:username='jalcine'
  let g:coloring_current='Tomorrow'
  let g:used_javascript_libs='underscore,backbone,jquery,jasmine'
  let g:javascript_conceal=1
  let g:snips_author=g:author

  " This allows Vim to fold its own script files.
  let g:vimsyn_folding='afPr'
  let g:vimsyn_embed='Pr'

  let g:cmake_use_vimux=1
  let g:cmake_use_dispatch=1
  let g:cmake_build_shared_libs=1
  let g:cmake_set_makeprg=1
  let g:cmake_inject_flags={
    \ 'syntastic': 1,
    \ 'ycm':       1
    \ }

  "{{{ Airline config
  let g:airline_detect_modified=1
  let g:airline_powerline_fonts=1
  let g:airline_detect_iminsert=1
  let g:airline#extensions#hunks#non_zero_only=1
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#tab_nr_type=1
  let g:airline#extensions#tabline#fnamemod=':p:t'
  let g:airline#extensions#branch#enabled=1
  let g:airline#extensions#branch#empty_message=''
  let g:airline#extensions#whitespace#enabled=0
  let g:airline_exclude_preview=1
  let g:airline_mode_map={
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
      \ '' : 'S'
      \ }

  "{{{ YouCompleteMe
  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_autoclose_preview_window_after_insertion=1
  let g:ycm_confirm_extra_conf=0
  let g:ycm_seed_identifiers_with_syntax=1
  let g:ycm_server_use_vim_stdout=0
  let g:ycm_use_utlisnips_completer=1
  let g:ycm_cache_omnifunc=1
  let g:ycm_complete_in_strings=0
  let g:ycm_add_preview_to_completeopt=1
  let g:ycm_semantic_triggers= {
    \ 'c'          : [ '->', '.', '(', ',', '='],
    \ 'cpp,objcpp' : [ '->', '.', ':: ', '(',',', '=', '+'],
    \ 'perl'       : [ '->', '(', ':: ', ','],
    \ 'php'        : [ '->', '::', '(', '='],
    \ 'ruby'       : [ '.', '::', '(', '{', '=', '+', '-', '/'],
    \ 'lua'        : [ '.', ':'],
    \ 'erlang'     : [ ':'],
    \ }

  "{{{ Syntastic options
  let g:syntastic_enable_signs=1
  let g:syntastic_aggregate_errors=1
  let g:syntastic_enable_highlight=1
  let g:syntastic_echo_current_error=1
  let g:syntastic_auto_loc_list=2
  let g:syntastic_loc_list_length=3
  let g:syntastic_auto_jump=0
  "let g:syntastic_quiet_messages={'level' : 'warnings'}
  "let g:syntastic_ruby_exec=system('rbenv which ruby')
  "let g:syntastic_sass_check_partials=1

  let g:unite_enable_start_insert=1
  let g:unite_update_time=5
  let g:unite_force_overwrite_statusline=1
  let g:unite_winheight=5
  let g:unite_enable_short_sources_names=0
  let g:unite_source_history_yank_enable=1
  let g:unite_source_rec_max_cache_files=5000
  if executable('ag')
    let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ' .
      \ '".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" ' .
      \ '--hidden -g ""'
  endif
  let g:unite_prompt=' '
  let g:jalcine_unite_options='-buffer-name=jalcine -complete'
  let g:jalcine_unite_sources='file_rec/async buffer ' .
    \ 'tag tag/file tag/include ' .
    \ 'webcolorname tab jump mapping history/yank window ' .
    \ 'tmux/clients tmux/sessions tmux/panes tmux/windows tmux ' .
    \ 'git_modified git_untracked git_cached'

  "{{{ indentLine
  "let g:indentLine_char="┆"
  "let g:indentLine_first_char="│"
  "let g:indentLine_showFirstIndentLevel=1
  "}}}

  "{{{ CoVim
  let g:CoVim_default_name="CoVimming"
  let g:CoVim_default_port="9320"

  " {{{ vim-session
  let g:session_directory="~/.vim/sessions"
  let g:session_default_name="default"
  let g:session_autoload="no"
  let g:session_autosave="yes"
  let g:session_autosave_periodic=2
  let g:session_command_aliases=1
  let g:session_default_overwrite=1
  let g:session_default_to_last=0
  let g:session_verbose_messages=0

  "let g:eighties_enabled=1
  "let g:eighties_minimum_width=78
  "let g:eighties_extra_width=2

  let g:voogle_map="<leader>gg"

  "{{{ Snippets
  let g:UltiSnipsEditSplit="horizontal"
  let g:UltiSnipsExpandTrigger="<C-l>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
  let g:UltiSnipsSnippetDirectories=["UltiSnips"]

  "{{{ Android
  let g:android_default_package_path="me.jalcine"
  let g:android_default_project_path="$HOME/Development/Projects"

  "{{{ GitHub configuration
  let g:github_user=g:username
  let g:github_dashboard={
    \ "username" : g:github_user,
    \ "emoji" : 1,
    \ "position": "top"
    \ }
  let g:github_search_path_format="$HOME/Development/Projects"
  let g:github_comment_open_browser=1
  "}}}

  "{{{ Vimux 
  let g:VimuxPromptString=g:unite_prompt
  let g:VimuxUseNearestPane=1
  let g:VimuxOrientation="v"
  "}}}

  "{{{ NERDTree
  let g:NERDTreeAutoCenter=1
  let g:NERDTreeHighlightCursorline=1
  let g:NERDTreeShowHidden=1
  let g:NERDTreeMinimalUI=1
  let g:NERDTreeDirArrows=1
  let g:NERDTreeCascadeOpenSingleChildDir=1
  let g:NERDTreeAutoDeleteBuffer=1
  "}}}

  "{{{ Tagbar
  let g:tagbar_compact=1
  let g:tagbar_autoshowtag=1
  let g:tagbar_type_markdown={
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
    \ }
  let g:tagbar_type_coffee={
    \ 'ctagsbin' : 'coffeetags',
    \ 'ctagsargs' : '',
    \ 'kinds' : [
      \ 'f:function!s',
      \ 'o:object',
      \ ],
    \ 'sro' : ".",
    \ 'kind2scope' : {
      \ 'f' : 'object',
      \ 'o' : 'object',
      \ }
    \ }
  let g:extradite_showhash=1
  let g:rails_projections={
    \ "app/uploaders/*_uploader.rb": {
    \   "command": "uploader",
    \   "template":
    \     "class %SUploader < CarrierWave::Uploader::Base\nend",
    \   "test": [
    \     "test/unit/%s_uploader_test.rb",
    \     "spec/models/%s_uploader_spec.rb"
    \   ],
    \   "keywords": "process version"
    \ },
    \ "features/support/*.rb": {"command": "support"},
    \ "features/support/env.rb": {"command": "support"}}

  "{{{ Signify
  let g:signify_vcs_list=['git','hg','svn','bzr']
  let g:signify_sign_overwrite=1
  let g:signify_line_highlight=0
  let g:signify_update_on_focusgained=1
  let g:signify_disable_by_default=0
  let g:signify_sign_add='✚'
  let g:signify_sign_change='✻'
  let g:signify_sign_delete='✖'
  let g:signify_cursorhold_normal=0
  let g:signify_cursorhold_insert=0
  "}}}

  let g:coloring = {
    \ 'Tomorrow' : {
    \   'colorscheme' : 'Tomorrow-Night',
    \   'airline'     : 'tomorrow'
    \  },
    \ 'Light' : {
    \   'colorscheme' : 'mayansmoke',
    \   'airline'     : 'sol'
    \  },
    \ 'Herald' : {
    \   'colorscheme' : 'herald',
    \   'airline'     : 'luna'
    \  },
    \ 'Molokai' : {
    \   'colorscheme' : 'molokai',
    \   'airline'     : 'molokai'
    \  },
    \ 'Dark' : {
    \   'colorscheme' : 'distinguished',
    \   'airline'     : ''
    \  },
    \ 'Solarized' : {
    \   'colorscheme' : 'solarized',
    \   'airline'     : 'Solarized',
    \ },
    \ 'JellyBeans' : {
    \   'colorscheme' : 'jellybeans',
    \   'airline'     : 'jellybeans'
    \  },
    \ 'Lucius' : {
    \   'colorscheme' : 'lucius',
    \   'airline'     : 'lucius'
    \ } ,
    \ 'Zenburn' : {
    \   'colorscheme' : 'zenburn',
    \   'airline'     : 'zenburn'
    \ } ,
    \ 'Distinguished' : {
    \   'colorscheme' : 'distinguished',
    \   'airline'     : 'serene'
    \ },
    \ 'Badwolf' : {
    \   'colorscheme' : 'badwolf',
    \   'airline'     : 'badwolf'
    \ },
    \ 'Understated' : {
    \   'colorscheme' : 'understated',
    \   'airline'     : 'understated'
    \ },
    \ 'Kolor' : {
    \   'colorscheme' : 'kolor',
    \   'airline'     : 'kolor'
    \ },
    \ 'Obsidian' : {
    \   'colorscheme' : 'obsidian',
    \   'airline'     : 'laederon'
    \ },
    \ 'Defacto' : {
    \  'colorscheme' : 'badwolf',
    \  'airline'     : 'badwolf'
    \ }
    \ }
endfunction

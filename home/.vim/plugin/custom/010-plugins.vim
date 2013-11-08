" vim: set fdm=marker tw=78 ft=vim

if exists("g:jalcine_plugin_loaded")
  finish
else
  let g:jalcine_plugin_loaded = 1
endif

"{{{ Personal plug-in dev
let my_plugin_prefix = 'jalcine/'

if $VIM_PLUGIN_DEV
  let my_plugin_prefix = 'file:///home/jacky/Development/Projects/'
else
  let my_plugin_prefix = 'jalcine/'
end

" We turn off file-type detection for now, this is
" required for using Vundle.
filetype off

"{{{ Plug-ins

" For plug-in management, I strongly recommend Vundle. It kicks Martian ass!
set rtp+=~/.vim/bundle/vundle

" Invoke the swag!
call vundle#rc()

" Some plugins I'm iffy about.
if $VIM_PLUGIN_IFFY
  Bundle "spolu/dwm.vim"
  Bundle "tpope/vim-dispatch"
  Bundle "mattn/emmet-vim"
  Bundle 'FredKSchott/CoVim'
endif

" Keep Vundle up to date.
" {{{ Libraries
Bundle 'gmarik/vundle'
Bundle 'xolox/vim-misc'
Bundle 'mattn/webapi-vim'

Bundle 'mechatroner/minimal_gdb'
Bundle 'kayaalpg/vim-sunflower'

"{{{ Core function
"  These plugins provide the root functionality of my Vim setup.
"  I don't see me using Vim without these guys.

" Make GVim themes work ootb in CVim.
Bundle 'godlygeek/csapprox'

" Universal editor support
Bundle 'editorconfig/editorconfig-vim'

Bundle 'moll/vim-node'

" Make everything repeat.
Bundle "tpope/vim-repeat"

" Surround like a boss.
Bundle "tpope/vim-surround"

" Wrap up what I was doing.
Bundle "Raimondi/delimitMate"

" Add indentation lines.
Bundle 'Yggdroot/indentLine'

" tmux key-bindings into Vim.
Bundle 'benmills/vimux'

" Colors! Colors EVERYWHERE!
Bundle 'guns/xterm-color-table.vim'

" Lightweight modular status-line.
Bundle 'bling/vim-airline'

" Improved session support.
Bundle 'xolox/vim-session'

" Show me the tags!
Bundle 'majutsushi/tagbar'

" Support for Markdown in Tagbar
Bundle 't4ku/marktag'

Bundle (my_plugin_prefix . 'android.vim')
Bundle (my_plugin_prefix . 'cmake.vim')
Bundle (my_plugin_prefix . 'vim-snippets')
Bundle (my_plugin_prefix . 'localrc.vim')
Bundle (my_plugin_prefix . 'vim-rdoc')
Bundle (my_plugin_prefix . 'tagbar')

"{{{ Editing Extensbility

" Tweak dates + times on-the-fly.
Bundle 'tpope/vim-speeddating'

" Tweaked text indentation for Vim.
Bundle 'godlygeek/tabular'

" Transparent GNUPG editing of files.
Bundle 'jamessan/vim-gnupg'

" Awesome jazz.
Bundle 'scrooloose/syntastic'

" Super-charged file navigation.
Bundle 'scrooloose/nerdtree'

" Make NERDTree into all of the TABS!
Bundle 'jistr/vim-nerdtree-tabs'

" Advanced commenting for Vim.
Bundle 'scrooloose/nerdcommenter'

" Advanced TODO support in Vim.
Bundle 'aaronbieber/quicktask'

" A useful completer.
Bundle 'Valloric/YouCompleteMe'

" Formatting tools.
Bundle 'Chiel92/vim-autoformat'

" Advanced editing/refactoring support.
Bundle 'terryma/vim-multiple-cursors'

"{{{ VCS
" Let us know what happens in files.
Bundle 'mhinz/vim-signify'

" Added function for vim-fugitive
Bundle 'int3/vim-extradite'

" Oh so bad, you.
Bundle 'tpope/vim-fugitive'

" Formatting for Git files (.git/COMMIT_MSG and the like).
Bundle 'tpope/vim-git'

"{{{ Formatting
" HAML (.haml) formatting support.
Bundle 'tpope/vim-haml'

" Markdown (.md, .markdown) formatting support.
Bundle 'tpope/vim-markdown'

" CoffeeScript fomatting support.
Bundle 'kchmck/vim-coffee-script'

" JavaScript formatting support.
Bundle 'pangloss/vim-javascript'

" JSON formatting support.
Bundle 'helino/vim-json'

" LESS formatting support.
Bundle 'groenewege/vim-less'

" JADE formatting support.
Bundle 'digitaltoad/vim-jade'

" Perl formatting support.
Bundle 'vim-perl/vim-perl'

Bundle 'danchoi/ri.vim'

" HTML5 formatting support.
Bundle 'othree/html5.vim'

" Background color for CSS/SCSS highlighting.
Bundle 'skammer/vim-css-color'

" Database Management
Bundle 'dbext.vim'

"{{{ Ruby
" Get some Bundle handles.
Bundle 'tpope/vim-bundler'

" Handle some rbenv triggers.
Bundle 'tpope/vim-rbenv'

" Rails. In VIM.
Bundle 'tpope/vim-rails'

" Rakeify yourself.
Bundle 'tpope/vim-rake'

" Debugz the Ruby
Bundle 'astashov/vim-ruby-debugger'

"{{{ GitHub TOOLS <3
" From Vim to Gist.
Bundle 'mattn/gist-vim'

" Search for shit on GitHub.
Bundle 'gmarik/github-search.vim'

" Check out activity and dashboards on GitHub.
Bundle 'junegunn/vim-github-dashboard'

" Add comments to code in GitHub.
Bundle 'mmozuras/vim-github-comment'

"{{{ Snippet and Completion Tools

" Snippet manager.
Bundle 'SirVer/ultisnips'

" Sterioids.
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'

" Abbreviatations like a boss.
Bundle 'tpope/vim-abolish'

"{{{ Coloring and UI
" Massive list of color themes.
Bundle 'flazz/vim-colorschemes'

" Tomorrow Theme.
Bundle 'chriskempson/tomorrow-theme', { 'rtp' : 'vim' }

" Solarized color theme.
Bundle 'altercation/solarized', { 'rtp' : 'vim-colors-solarized' }

Bundle 'closetag.vim'
Bundle 'justinmk/vim-syntax-extra'

" Enable file formats from plug-ins.
filetype plugin indent on

" Re-confirm enabling of syntax.
syntax on

" Rock on!

" vim: set fdm=marker tw=78 ft=vim

if exists("g:jalcine_plugins_loaded")
  finish
else
  let g:jalcine_plugins_loaded = 1
endif

" We turn off file-type detection for now, this is
" required for using Vundle.
filetype off

"{{{ Plug-ins

" For my personal extension development, I use Vundle. Use it.
set rtp+=~/.vim/bundle/vundle

" Invoke the swag!
call vundle#rc()

" Some plugins I'm iffy about.
"Bundle "spolu/dwm.vim"
"Bundle "Raimondi/delimitMate"
"Bundle "tpope/vim-surround"
"Bundle "tpope/vim-dispatch"
"Bundle "mattn/emmet-vim"

" Keep Vundle up to date.
" {{{ Libraries
Bundle 'gmarik/vundle'
Bundle 'xolox/vim-misc'
Bundle 'mattn/webapi-vim'

"{{{ Core function
"  These plugins provide the root functionality of my Vim setup.
"  I don't see me using Vim without these guys.

" Make GVim themes work ootb in CVim.
Bundle 'godlygeek/csapprox'

" Universal editor support
"Bundle 'editorconfig/editorconfig-vim'

" Add indentation lines.
Bundle 'Yggdroot/indentLine'

" Provides a means of quick-n-easy pair programming. Just add water.
"Bundle 'FredKSchott/CoVim'

" tmux key-bindings into Vim.
Bundle 'benmills/vimux'

" Lightweight modular status-line.
Bundle 'bling/vim-airline'

" Improved session support.
Bundle 'xolox/vim-session'

" Tasks just like Eclipse, yo.
"Bundle 'jalcine/TaskList.vim'

" Load local configuration.
Bundle 'jalcine/localrc.vim'

" Show me the tags!
Bundle 'majutsushi/tagbar'

" Support for Markdown in Tagbar
Bundle 't4ku/marktag'

" Incorporate CMake support.
Bundle 'jalcine/cmake.vim'

" Incorporate Android support.
" Bundle 'jalcine/android.vim'

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
"Bundle 'groenewege/vim-less'

" JADE formatting support.
"Bundle 'digitaltoad/vim-jade'

" Perl formatting support.
"Bundle 'vim-perl/vim-perl'

" HTML5 formatting support.
Bundle 'othree/html5.vim'

" Background color for CSS/SCSS highlighting.
Bundle 'skammer/vim-css-color'

"{{{ Ruby
" Get some Bundle handles.
Bundle 'tpope/vim-bundler'

" Handle some rbenv triggers.
Bundle 'tpope/vim-rbenv'

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

" My personal fork + build of snippets.
"Bundle 'jalcine/vim-snippets'

" File and buffer search tool.
Bundle 'kien/ctrlp.vim'

"{{{ Coloring and UI
" Awesome ass themes for Vim.
"Bundle "daylerees/colour-schemes", { 'rtp' : 'vim-themes' }

" Massive list of color themes.
Bundle 'flazz/vim-colorschemes'

" Tomorrow Theme.
Bundle 'chriskempson/tomorrow-theme', { 'rtp' : 'vim' }

" Enable file formats from plug-ins.
filetype plugin indent on

" Re-confirm enabling of syntax.
syntax on

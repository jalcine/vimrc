let g:plug_window = 'botright new | resize 6'
let g:rooter_use_lcd = 1
let g:airline_powerline_fonts = 1

func! plugins#define()
  call g:plug#begin(g:jalcine.plugins.dir)
  Plug 'tpope/vim-sensible'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Chiel92/vim-autoformat'
  Plug 'KabbAmine/zeavim.vim'
  Plug 'Konfekt/FastFold'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'Sunset'
  Plug 'airblade/vim-rooter'
  Plug 'benekastah/neomake'
  Plug 'bogado/file-line'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'janko-m/vim-test'
  Plug 'jceb/vim-orgmode'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'klen/python-mode', { 'for': 'python'}
  Plug 'koron/minimap-vim'
  Plug 'majutsushi/tagbar' | Plug 'TagHighlight'
  Plug 'mattesgroeger/vim-bookmarks'
  Plug 'mattn/gist-vim'
  Plug 'mattn/webapi-vim'
  Plug 'mhinz/vim-signify'
  Plug 'mhinz/vim-startify'
  Plug 'low-ghost/nerdtree-fugitive'
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'sheerun/vim-polyglot'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'w0ng/vim-hybrid'
  Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'
  Plug 'xolox/vim-notes'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'zandrmartin/vim-distinguished'

  call g:plug#end()
endfunc

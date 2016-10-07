let g:plug_window = 'botright new | resize 6'
let g:rooter_use_lcd = 1
let g:airline_powerline_fonts = 1

func! plugins#define()
  call g:plug#begin(g:jalcine.plugins.dir)
  Plug 'tpope/vim-sensible'
  Plug 'ryanoasis/vim-devicons'

  Plug 'SirVer/ultisnips'
        \ | Plug 'honza/vim-snippets'
  Plug 'junegunn/vim-easy-align'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'majutsushi/tagbar'
  Plug 'vim-airline/vim-airline'

  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-easytags'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'Chiel92/vim-autoformat'

  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'mhinz/vim-startify'
  Plug 'airblade/vim-rooter'
  Plug 'rking/ag.vim'
  Plug 'tpope/vim-fugitive'

  Plug 'sheerun/vim-polyglot'
  Plug 'klen/python-mode'

  Plug 'w0ng/vim-hybrid'
  Plug 'zandrmartin/vim-distinguished'

  Plug 'Sunset'

  call g:plug#end()
endfunc

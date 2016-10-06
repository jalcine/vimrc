let g:plug_window = 'botright new | resize 6'

func! plugins#define()
  call g:plug#begin(g:jalcine.plugins.dir)
  Plug 'tpope/vim-sensible'
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

  Plug 'w0ng/vim-hybrid'
  Plug 'zandrmartin/vim-distinguished'

  Plug 'Sunset'

  call g:plug#end()
endfunc

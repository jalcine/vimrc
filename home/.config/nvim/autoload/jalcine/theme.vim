let g:jalcine.theme = {
      \ 'light': {
      \   'colorscheme': 'base16-default-light',
      \   'airline':     'base16_default',
      \ },
      \ 'dark': {
      \   'colorscheme': 'base16-ir-black',
      \   'airline':     'base16_default',
      \ }
      \ }

func! jalcine#theme#setup() abort
  let g:base16colorspace=256
  set termguicolors
  if filereadable(expand('~/.vimrc_background'))
    source ~/.vimrc_background
  else
    exec 'AirlineTheme ' . g:jalcine.theme[&background].airline
    exec 'colorscheme ' .  g:jalcine.theme[&background].colorscheme
  endif
endfunc

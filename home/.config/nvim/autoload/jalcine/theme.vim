let g:jalcine.theme = {
      \ 'light': {
      \   'colorscheme': 'base16-classic-light',
      \   'airline':     'base16',
      \ },
      \ 'dark': {
      \   'colorscheme': 'base16-classic-dark',
      \   'airline':     'base16',
      \ }
      \ }

func! jalcine#theme#go(mode) abort
  if a:mode !=? 'light' && a:mode !=? 'dark'
    return
  endif

  exec 'set background=' . a:mode
  call jalcine#theme#load()
endfunc

func! jalcine#theme#setup() abort
  let g:base16colorspace=256

  if filereadable(expand('~/.vimrc_background'))
    source ~/.vimrc_background
  else
    call jalcine#theme#load()
  endif
endfunc

func! jalcine#theme#load() abort
  let g:airline_theme = g:jalcine.theme[&background].airline
  exec 'colorscheme ' .  g:jalcine.theme[&background].colorscheme

  if v:vim_did_enter == 1
    exec 'AirlineTheme ' . g:airline_theme
  endif
endfunc

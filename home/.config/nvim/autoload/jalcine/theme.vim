let g:jalcine.theme = {
      \ 'light': {
      \   'colorscheme': 'base16-google',
      \   'airline':     'base16',
      \ },
      \ 'dark': {
      \   'colorscheme': 'base16-apathy',
      \   'airline':     'wombat',
      \ }
      \ }

func! jalcine#theme#go(mode) abort
  if a:mode !=? 'light' && a:mode !=? 'dark'
    return
  endif

  exec 'set background=' . a:mode
  call jalcine#theme#setup()
endfunc

func! jalcine#theme#setup() abort
  let g:base16colorspace=256
  set termguicolors

  if filereadable(expand('~/.vimrc_background'))
    source ~/.vimrc_background
  else
    call jalcine#theme#load()
  endif
endfunc

func! jalcine#theme#load() abort
  exec 'colorscheme ' .  g:jalcine.theme[&background].colorscheme

  hi SignColumn guibg=NONE
  hi FoldColumn guibg=NONE
  hi LineNr guibg=NONE
  hi DiffAdd gui=bold guibg=NONE
  hi DiffDelete gui=bold guibg=NONE
  hi DiffChange gui=bold guibg=NONE

  let g:airline_theme = g:jalcine.theme[&background].colorscheme

  if v:vim_did_enter == 1
    exec 'AirlineTheme ' . g:airline_theme
  endif
endfunc

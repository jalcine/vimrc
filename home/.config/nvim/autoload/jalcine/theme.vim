" File:          autoload/theme.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: December 11, 2017

let g:jalcine.theme = {
      \ 'light': {
      \   'colorscheme': 'base16-gruvbox-light-medium',
      \ },
      \ 'dark': {
      \   'colorscheme': 'base16-irblack',
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
  exec 'colorscheme ' .  g:jalcine.theme[&background].colorscheme
  let g:lightline.colorscheme = '16color'
  call lightline#colorscheme()
endfunc

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

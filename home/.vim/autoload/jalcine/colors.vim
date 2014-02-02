" File: plugins/colors.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Controls logic for coloring.
" Last Modified: 2014-01-31 03:20:54 EST
" This is the color matrix. Wake up, Neo.

func! jalcine#colors#rotate()
  let zi = index(keys(g:coloring), g:coloring_current)
  if (zi + 1) == len(keys(g:coloring))
    let zi = 0
  else
    let zi += 1
  endif

  call jalcine#colors#apply(keys(g:coloring)[zi])
endfunc

func! jalcine#colors#apply(the_profile)
  let color_opts = g:coloring[a:the_profile]
  exec('colorscheme ' . color_opts.colorscheme)
  call airline#switch_theme(color_opts.airline)
  let g:coloring_current = a:the_profile
endfunc

function! jalcine#colors#detect()
  " Set the default color scheme, in the event it's not defined.
  if exists($KONSOLE_PROFILE_NAME)
    call jalcine#colors#apply($KONSOLE_PROFILE_NAME)
  elseif exists('g:coloring_current')
    call jalcine#colors#apply(g:coloring_current)
  else
    call jalcine#colors#apply('Shell')
  endif
endfunction

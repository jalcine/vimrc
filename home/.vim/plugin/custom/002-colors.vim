let g:coloring = {
  \ 'Tomorrow' : {
  \   'colorscheme' : 'Tomorrow-Night',
  \   'airline'     : 'tomorrow'
  \  },
  \ 'Light' : {
  \   'colorscheme' : 'github',
  \   'airline'     : 'luna'
  \  },
  \ 'Molokai' : {
  \   'colorscheme' : 'molokai',
  \   'airline'     : 'molokai'
  \  },
  \ 'Dark' : {
  \   'colorscheme' : 'badwolf',
  \   'airline'     : 'badwolf'
  \  },
  \ 'Solarized' : {
  \   'colorscheme' : 'solarized',
  \   'airline'     : 'Solarized',
  \ },
  \ 'JellyBeans' : {
  \   'colorscheme' : 'jellybeans',
  \   'airline'     : 'jellybeans'
  \  },
  \ 'Shell' : {
  \   'colorscheme' : 'kolor',
  \   'airline'     : 'luna'
  \ }
  \ }

func! b:toggle_colors()
  let zi = index(keys(g:coloring), g:coloring_current)
  if (zi + 1) == len(keys(g:coloring))
    let zi = 0
  else
    let zi += 1
  endif

  call s:apply_coloring(keys(g:coloring)[zi])
endfunc

func! s:apply_coloring(the_profile)
  let color_opts = g:coloring[a:the_profile]
  exec('colorscheme ' . color_opts.colorscheme)
  call airline#switch_theme(color_opts.airline)
  let g:coloring_current = a:the_profile
endfunc

" Toggle the color scheme on mapping.
nnoremap <silent> <leader>ks :call b:toggle_colors()<CR>

" Set the default color scheme, in the event it's not defined.
let g:coloring_current="Dark"

" Apply my coloring.
if exists($KONSOLE_PROFILE_NAME)
  call s:apply_coloring($KONSOLE_PROFILE_NAME)
else
  call s:apply_coloring(g:coloring_current)
endif

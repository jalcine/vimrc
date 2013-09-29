let g:coloring = {
      \ "Dark" : {
      \   "colorscheme" : "Monokai",
      \   "airline"     : "luna"
      \   },
      \ "Light" : {
      \   "colorscheme" : "zenesque",
      \   "airline"     : "zenburn"
      \  }
      \}

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
  exec("colorscheme " . color_opts.colorscheme)
  call airline#switch_theme(color_opts.airline)
  let g:coloring_current = a:the_profile
endfunc

" Toggle colorscheme on mapping.
nnoremap <silent> <leader>ds :call b:toggle_colors()<CR>

" Apply my coloring.
call s:apply_coloring($KONSOLE_PROFILE_NAME)

" File: plugins/colors.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Controls logic for coloring.

" Function: jalcine#colors#rotate
" Brief:    Cycles through the known color profiles.
func! jalcine#colors#rotate()
  let zi = index(keys(g:coloring), g:coloring_current)
  if (zi + 1) == len(keys(g:coloring))
    let zi = 0
  else
    let zi += 1
  endif

  call jalcine#colors#apply(keys(g:coloring)[zi])
endfunc

" Function: jalcine#colors#apply
" Brief:    Applies a color profile.
func! jalcine#colors#apply(the_profile)
  let g:coloring_current = a:the_profile
  let color_opts = g:coloring[a:the_profile]
  silent exec('colorscheme ' . color_opts.colorscheme)
  let &background="dark"
  call airline#switch_theme(color_opts.airline)

  " Do some work to the color themes to make it look nicer. Most themes don't
  " do this.
  hi Folded     ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi Number     ctermbg=NONE
  hi SignColumn ctermbg=NONE
  hi VertSplit  ctermbg=NONE
  hi Comment    ctermbg=NONE
  hi LineNr     ctermbg=NONE
endfunc

" Function: jalcine#colors#detect
" Brief:    Determines what color profile to use from the environment.
function! jalcine#colors#detect()
  " Set the default color scheme, in the event it's not defined.
  if has_key(g:coloring,$KONSOLE_PROFILE_NAME)
    call jalcine#colors#apply($KONSOLE_PROFILE_NAME)
  else
    call jalcine#colors#apply(g:coloring_current)
  endif
endfunction

" Function: s:complete_colors
" Brief:    Completion function for color profiles.
function! jalcine#colors#complete(ArgLead, CmdLine, CursorPos)
  let l:keys = sort(keys(g:coloring))
  if !empty(a:ArgLead)
    let l:keys = filter(l:keys, 'stridx(v:val,"' . a:CmdLine . '")')
  endif
  return l:keys
endfunction

" Add a lil' command for color profile completion.
command! -nargs=1 -complete=customlist,jalcine#colors#complete
  \ ApplyColoring :call jalcine#colors#apply("<args>")

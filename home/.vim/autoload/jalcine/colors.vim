" File: plugins/colors.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: Controls logic for coloring.
" Last Modified: 2014-01-31 03:20:54 EST

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
  let g:coloring_current = a:the_profile
  let color_opts = g:coloring[a:the_profile]
  silent exec('colorscheme ' . color_opts.colorscheme)
  call airline#switch_theme(color_opts.airline)

  " Do some work to the color themes to make it look nicer. Most themes don't
  " do this.
  hi Folded     ctermbg=NONE
  hi Number     ctermbg=NONE
  hi SignColumn ctermbg=NONE
  hi VertSplit  ctermbg=NONE
  hi Comment    ctermbg=NONE
  hi LineNr     ctermbg=NONE
endfunc

function! jalcine#colors#detect()
  " Set the default color scheme, in the event it's not defined.
  if has_key(g:coloring,$KONSOLE_PROFILE_NAME)
    call jalcine#colors#apply($KONSOLE_PROFILE_NAME)
  else
    call jalcine#colors#apply(g:coloring_current)
  endif
endfunction

function! s:complete_colors(ArgLead, CmdLine, CursorPos)
  let l:keys = sort(keys(g:coloring))
  if !empty(a:ArgLead)
    let l:keys = filter(l:keys, 'stridx(v:val,"' . a:CmdLine . '")')
  endif
  return l:keys
endfunction

" Add a lil' command.
command! -nargs=1 -complete=customlist,s:complete_colors 
  \ ApplyColoring :call jalcine#colors#apply("<args>")

" Function: jalcine#get_phys_coords_for_sunset
" Description: Fetches current physical coordinates.
func! jalcine#get_physical_coordinates()
  python << EOF
import requests
import vim

vim.command("let g:sunset_latitude='50'")
vim.command("let g:sunset_longitude='70'")
try:
  ip_info = requests.get('http://ipinfo.io')
  if ip_info.status_code is 200: 
      current_coords = ip_info.json()['loc'].split(',')
      vim.command("let g:sunset_latitude='" + current_coords[0] + "'")
      vim.command("let g:sunset_longitude='" + current_coords[1] + "'")
except BaseException:
  vim.command('colorscheme distinguished')
EOF
endfunc

func! Sunset_daytime_callback()
  colorscheme hybrid
  set background=light
  call jalcine#modify_colorscheme()
endfunc

func! Sunset_nighttime_callback()
  colorscheme distinguished
  set background=dark
  call jalcine#modify_colorscheme()
endfunc

func! jalcine#modify_colorscheme()
  hi link notesSingleQuoted Normal
  hi notesDoubleQuoted gui=italic
  hi notesBold cterm=bold
  hi notesItalic cterm=italic
  hi VertSplit ctermbg=NONE
  hi Split ctermbg=NONE
  hi Conceal ctermbg=NONE
  hi Folded ctermbg=NONE
  hi SignColumn ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi LineNr ctermbg=NONE
  hi Comment ctermbg=NONE
  hi NonText ctermbg=NONE
endfunc

call jalcine#get_physical_coordinates()

augroup jalcine
  au!

  " Github auto-complete.
  au FileType markdown,gitcommit
    \ imap <C-x><C-x> <Plug>(github-complete-manual-completion)
  au FileType gitcommit setl omnifunc=github_complete#complete

  " Funky files.
  " au User YouCompleteMe call youcompleteme#Enable()

  " Reload tmux files when we edit them.
  au BufWritePost *tmux*.conf  call s:reload_tmux()
  au BufWritePost *tmux/*.conf call s:reload_tmux()

  " Tweak for particular file types.
  au FileType css setl iskeyword+=-
  au FileType gitcommit setl spell

  " Enable Neomake to run on builds.
  au BufWritePost * Neomake
  au BufReadPost  * Neomake

  " Clear Fugitive buffers.
  au BufReadPost fugitive://* set bufhidden=delete

  " Things for Unite
  au FileType unite call s:unite_settings()

  au BufEnter   * let &titlestring=expand('%:p')

  " CoffeeScript jazz.
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent shiftwidth=2 expandtab
  au FileType javascript setl foldmethod=syntax

  au FileType css,scss setlocal foldmethod=marker foldmarker={,}
  au FileType css,scss nnoremap <silent> <leader>S vi{:sort<CR>
  au FileType ini set ft=dosini
  au FileType python setlocal foldmethod=indent
  au FileType markdown setlocal nolist
  au FileType vim setlocal fdm=indent keywordprg=:help
augroup END

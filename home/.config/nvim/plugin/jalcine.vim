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
  exec(':AirlineTheme default')
  set background=light
  call jalcine#modify_colorscheme()
endfunc

func! Sunset_nighttime_callback()
  colorscheme distinguished
  exec(':AirlineTheme distinguished')
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

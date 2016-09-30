" Function: jalcine#get_phys_coords_for_sunset
" Description: Fetches current physical coordinates.
func! jalcine#get_phys_coords_for_sunset()
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

call jalcine#get_phys_coords_for_sunset()

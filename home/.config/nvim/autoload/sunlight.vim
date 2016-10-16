func! sunlight#get_coords()
  python << EOF
import requests, vim, os

try:
  if os.environ.get('JALCINE_NEOVIM_NO_LOOKUP', None) is None:
    ip_info = requests.get('http://ipinfo.io', timeout=0.2)
    if ip_info.status_code is 200: 
        current_coords = ip_info.json()['loc'].split(',')
        vim.command("let g:sunset_latitude='" + current_coords[0] + "'")
        vim.command("let g:sunset_longitude='" + current_coords[1] + "'")
except:
  vim.command('echo "Cannot get location."')
EOF
endfunc

func! Sunset_daytime_callback()
  set background=dark
  call color#tweak()
endfunc

func! Sunset_nighttime_callback()
  set background=light
  call color#tweak()
endfunc

func! sunlight#bind()
  call sunlight#get_coords()
  call color#tweak()
endfunc

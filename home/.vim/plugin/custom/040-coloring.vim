" Toggling color scheme.
function! b:toggle_color()
  if g:colors_name != "Tomorrow"
    colorscheme Tomorrow
  else
    colorscheme Tomorrow-Night-Bright
  endif
endfunction

" Change if Konsole is defining a theme.
if $KONSOLE_PROFILE_NAME == "Light"
  let g:colors_name="Tomorrow"
end
if $KONSOLE_PROFILE_NAME == "Dark"
  let g:colors_name="Tomorrow-Night-Bright"
end

" Toggle colorscheme on mapping.
nnoremap <silent> <leader>ds :call b:toggle_color()<CR>

" Go dark by default.
set background=light
colorscheme Tomorrow-Night-Bright
call airline#switch_theme("tomorrow")

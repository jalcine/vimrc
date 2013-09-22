" Toggling color scheme.
function! b:toggle_color()
  if g:colors_name == "molokai"
    colorscheme Tomorrow
    call airline#switch_theme("tomorrow")
  else
    colorscheme molokai
    call airline#switch_theme("molokai")
  endif
endfunction

" Change if Konsole is defining a theme.
if $KONSOLE_PROFILE_NAME == "Light"
  let g:colors_name="Tomorrow"
end
if $KONSOLE_PROFILE_NAME == "Dark"
  let g:colors_name="molokai"
end

" Toggle colorscheme on mapping.
nnoremap <silent> <leader>ds :call b:toggle_color()<CR>

" Go dark by default.
set background=light
colorscheme molokai

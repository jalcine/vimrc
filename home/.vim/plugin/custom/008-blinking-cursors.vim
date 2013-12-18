" orange in insert mode, red in command mode
" if you want to use rgb color formatting:
"   konsoleprofile CustomCursorColor=#255255255
autocmd VimEnter * silent !konsoleprofile UseCustomCursorColor=1
let &t_SI = "\<Esc>]50;CustomCursorColor=orange;BlinkingCursorEnabled=1\x7"
let &t_EI = "\<Esc>]50;CustomCursorColor=red;BlinkingCursorEnabled=0\x7"
silent !konsoleprofile CustomCursorColor=red
autocmd VimLeave * silent !konsoleprofile CustomCursorColor=gray;BlinkingCursorEnabled=0

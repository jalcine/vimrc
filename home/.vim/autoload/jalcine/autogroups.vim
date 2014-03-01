" File: autoload/autogroups.vim
" Author: Jacky Alciné <me@jalcine.me>
" Description: My auto-groups and auto-commands for Vim.
" Last Modified: February 01, 2014

func! jalcine#autogroups#set()
  " Update appropriate files when I update them.
  augroup autosourcecfg
    au!
    au BufWritePost $MYVIMRC      call jalcine#autogroups#reload()
    au BufWritePost .local.vimrc  call s:load_current_buffer()
    au BufReadPre  $HOME/*tmux*  setl ft=tmux
    au BufWritePost $HOME/*tmux*  call jalcine#autogroups#reload_tmux()
  augroup END

  " Toggle the current cursor line whenever I swap windows.
  "augroup cline
    "au!
    "au InsertEnter * setlocal cursorline cursorcolumn
    "au InsertLeave * setlocal nocursorline nocursorcolumn
  "augroup END

  " Some files might need to be filetype'd properly.
  augroup fixfiletype
    au!
    au BufReadPost Guardfile           setl ft=ruby.guard
    au BufReadPost ~/.gitignore_global setl ft=gitignore
  augroup END

  autocmd FileType unite call jalcine#mappings#define_for_unite()
  autocmd VimEnter * silent call jalcine#colors#detect()
  call jalcine#autogroups#bind_konsole()
endfunction

func! jalcine#autogroups#bind_konsole()
  if !executable('konsole')
    return
  endif
  " So Konsole has this awesome ability to allow you edit almost anything
  " about it from the shell without any gunky API! This helps me switch the
  " color scheme and other things.
  augroup konsole
    au!
    silent !konsoleprofile CustomCursorColor=red
    autocmd VimEnter * silent !konsoleprofile UseCustomCursorColor=1;BlinkingCursorEnabled=1
    autocmd VimLeave * silent !konsoleprofile CustomCursorColor=gray;BlinkingCursorEnabled=0
  augroup END
endfunction

func! jalcine#autogroups#reload()
  let cs = g:colors_name
  echomsg "[jalcine.vim] Resourcing primary configuration..."
  source $MYVIMRC
  echomsg "[jalcine.vim] Resourcing jalcine.vim..."
  source  $HOME/.vim/autoload/jalcine.vim
  for file_path in glob('$HOME/.vim/autoload/jalcine/*.vim', 0, 1)
    echomsg "[jalcine.vim] Resourcing '" . file_path . "'..."
    exec('source ' . file_path)
  endfor

  echomsg "[jalcine.vim] Rolling out once more, this might take a while."
  call jalcine#roll_out()
  exec('colorscheme '. cs)
  echomsg "[jalcine.vim] Configuration sourced."
endfunc

func! s:load_current_buffer()
  if &ft == 'vim'
    source %
    echomsg "[jalcine.vim] Loaded local Vim configuration."
  else
    echoerr "[jalcine.vim] Not a VimScript file!"
  endif
endfunction

func! jalcine#autogroups#reload_tmux()
  call system('tmux source-file '. expand('%:p'))
  call system("tmux display-message '[jalcine.vim] Configuration of tmux " .
    \ "reloaded using ". expand('%:p') . ".'")
endfunction

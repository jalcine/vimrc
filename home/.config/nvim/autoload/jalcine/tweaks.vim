scriptencoding utf-8

function! VagrantTransform(cmd) abort
  let l:vagrant_project = get(matchlist(join(readfile('Vagrantfile'), '\n'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  return 'vagrant ssh --command '.shellescape('cd ' . l:vagrant_project . '; '.a:cmd)
endfunction

function! DockerTransform(cmd) abort
  return 'docker run ' . g:test_docker_container . ' '.shellescape(a:cmd)
endfunction

function! DockerComposeTransform(cmd) abort
  return 'docker-compose run ' . b:test_docker_compose_service . ' '.shellescape(a:cmd)
endfunction

let g:test#custom_transformations = {
      \ 'vagrant': function('VagrantTransform'),
      \ 'docker': function('DockerTransform'),
      \ 'docker-compose': function('DockerComposeTransform')
      \}

func! jalcine#tweaks#goyo_enter() abort
  Limelight
  call jalcine#color#tweak()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

func! jalcine#tweaks#goyo_leave() abort
  set scrolloff=5
  set showcmd
  set showmode
  Limelight
  call jalcine#color#tweak()
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  silent !tmux set status on
endfunction

func! jalcine#tweaks#reload_tmux() abort
  redraw | echomsg '[tmux ➡️  vim] Sourced ' . expand('%:p') . '.' | redraw
  call system('tmux source-file ' . expand('%:p') . '; tmux display-message ' .
        \ '"[tmux ⬅️  vim] Sourced ' . expand('%:p') . '"')
endfunc

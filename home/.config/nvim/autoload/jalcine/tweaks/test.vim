function! s:VagrantTransform(cmd) abort
  let l:vagrant_project = get(matchlist(join(readfile('Vagrantfile'), '\n'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  return 'vagrant ssh --command '.shellescape('cd ' . l:vagrant_project . '; '.a:cmd)
endfunction

function! s:DockerTransform(cmd) abort
  return 'docker run ' . g:test_docker_container . ' '.shellescape(a:cmd)
endfunction

function! s:DockerComposeTransform(cmd) abort
  return 'docker-compose run ' . b:test_docker_compose_service . ' '.shellescape(a:cmd)
endfunction

func! jalcine#tweaks#test#init() abort
  let g:test#custom_transformations = {
        \ 'vagrant': function('<SID>VagrantTransform'),
        \ 'docker': function('<SID>DockerTransform'),
        \ 'docker-compose': function('<SID>DockerComposeTransform')
  \}
endfunc

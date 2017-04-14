function! VagrantTransform(cmd) abort
  let l:vagrant_project = get(matchlist(s:cat('Vagrantfile'), '\vconfig\.vm.synced_folder ["''].+[''"], ["''](.+)[''"]'), 1)
  return 'vagrant ssh --command '.shellescape('cd '.vagrant_project.'; '.a:cmd)
endfunction

function! DockerTransform(cmd) abort
  return 'docker run '.g:test_docker_container.' '.shellescape(a:cmd)
endfunction

function! DockerComposeTransform(cmd) abort
  return 'docker-compose run ' . b:test_docker_compose_service . ' '.shellescape(a:cmd)
endfunction

let g:test#custom_transformations = {
      \ 'vagrant': function('VagrantTransform'),
      \ 'docker': function('DockerTransform'),
      \ 'docker-compose': function('DockerComposeTransform')
      \}

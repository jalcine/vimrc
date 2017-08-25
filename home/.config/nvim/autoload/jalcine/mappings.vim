let g:jalcine.mappings = {
      \ 'leader':  ','
      \ }

func! jalcine#mappings#apply_bulk(mappings_list, opts) abort
  for a_mapping in mappings_list
    let l:command = a_mapping[0]

    if has_key(a:opts, 'prefix')
      let l:command = a:opts.prefix . l:command
    endif

    let l:modes = get(a_mapping, 2, 'n')
    for mode in l:modes
      let l:exc_cmd = mode . 'noremap '
            \ . '<silent> '
            \ . g:jalcine.mappings.leader . l:command
            \ . ' '
            \ . get(a_mapping, 1)
    endfor
  endfor
endfunc

func! jalcine#mappings#setup() abort
  exec 'let mapleader=' . g.jalcine.mappings.leader
endfunc

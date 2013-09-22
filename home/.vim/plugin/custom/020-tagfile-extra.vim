" Automatically update tag linkages.
augroup gimmetags
  au!
  au FileReadPost * call s:load_local_tags()<CR>
  au FileWritePost * call s:load_local_tags()<CR>
augroup END

" Ensures that local tags are loaded into the mix.
function! s:load_local_tags()
  set tags+=$PWD/.tags
  set tags+=$PWD/TAGS,
  set tags+=$PWD/tags
  set tags+=$PWD/.bzr/tags
  set tags+=$PWD/.git/tags
  set tags+=$PWD/.svn/tags
  set tags+=$PWD/.hg/tags
  set tags+=$PWD/build/tags
endfunction

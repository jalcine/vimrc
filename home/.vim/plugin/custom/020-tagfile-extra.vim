" Automatically update tag linkages.
augroup gimmetags
  au!
  au FileReadPost * call s:load_local_tags()<CR>
  au FileWritePost * call s:load_local_tags()<CR>
augroup END

" Ensures that local tags are loaded into the mix.
function! s:load_local_tags()
  setl tags+=$PWD/.tags
  setl tags+=$PWD/TAGS,
  setl tags+=$PWD/tags
  setl tags+=$PWD/.bzr/tags
  setl tags+=$PWD/.git/tags
  setl tags+=$PWD/.svn/tags
  setl tags+=$PWD/.hg/tags
  setl tags+=$PWD/build/tags
endfunction

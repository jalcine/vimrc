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

let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }

" Improve C++ matching.
let g:tagbar_type_cpp = {
      \ 'kinds' : [
      \ 'd:macros:1:0',
      \ 'p:prototypes:1:0',
      \ 'g:enums',
      \ 'e:enumerators:0:0',
      \ 't:typedefs:0:0',
      \ 'n:namespaces',
      \ 'c:classes',
      \ 's:structs',
      \ 'u:unions',
      \ 'f:functions',
      \ 'm:members:0:0',
      \ 'v:variables:0:0',
      \ ],
      \ }

" Make sure we use CoffeTags, shun.
let g:tagbar_type_coffee = {
      \ 'ctagsbin' : 'coffeetags',
      \ 'ctagsargs' : '',
      \ 'kinds' : [
      \ 'f:functions',
      \ 'o:object',
      \ ],
      \ 'sro' : ".",
      \ 'kind2scope' : {
      \ 'f' : 'object',
      \ 'o' : 'object',
      \ }
      \ }

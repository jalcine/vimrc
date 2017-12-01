" File:          jalcine/status.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   Options for le status line. 
" Last Modified: November 28, 2017


func! jalcine#status#setup() abort
  call <SID>Configure()
  call lightline#update()
endfunc

func! s:Configure() abort
  let g:lightline = {}
  let g:lightline.colorscheme = 'jellybeans'
  let g:lightline.active = {
        \ 'left': [ [ 'mode' ],
        \           [ 'vcs' ],
        \           [ 'fileicon', 'modified', 'relativepath' ] ],
        \ 'right': [ [ 'paste', ],
        \            [ 'pos', 'readonly' ],
        \            [ 'lint' ]  ] }
  let g:lightline.inactive = {
        \ 'left': [ [ 'filename' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ] ] }
  let g:lightline.tabline = {
        \ 'left': [ [ 'tabs' ] ],
        \ 'right': [ [ 'pos', 'close' ] ] }
  let g:lightline.tab = {
        \ 'active': [ 'tabnum', 'filename', 'modified' ],
        \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }
  let g:lightline.component = {
        \ 'readonly': emoji#for('lock'),
        \ 'pos': ' %l:%c / B:%n W: %{winnr()}',
        \ 'spell': ' %{emoji#for("pencil")}%{&spelllang}',
        \ 'lint': '%{jalcine#status#get("lint")}',
        \ 'vcs': '%{jalcine#status#get("vcs")}'
        \ }
  let g:lightline.component_function = {
        \ 'fileicon': 'WebDevIconsGetFileTypeSymbol',
        \ }
  let g:lightline.component_visible_condition = {
        \ 'gitbranch': 'fugitive#head() !== ""',
        \ }
  let g:lightline.separator = { 'left': '', 'right': '' }
  let g:lightline.subseparator =  { 'left': '', 'right': '' }
  let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ }
endfunc

function! jalcine#status#update_colorscheme()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    if g:colors_name =~# 'wombat\|solarized\|landscape\|jellybeans\|seoul256\|Tomorrow'
      let g:lightline.colorscheme =
            \ substitute(substitute(g:colors_name, '-', '_', 'g'), '256.*', '', '')
      call lightline#init()
      call lightline#colorscheme()
    endif
  catch
  endtry
endfunction

func! jalcine#status#get(part) abort
  if a:part == 'vcs'
    if !exists('fugitive#head') | return | endif

    let l:name = fugitive#head(8)
    if empty(l:name)
      return ""
    else
      let l:name = " " . l:name
    endif

    return l:name
  elseif a:part == 'lint'
    let l:status = ale#statusline#Status()
    if l:status == "OK"
      return ""
    else
      return l:status
    endif
  endif

  return ""
endfunc

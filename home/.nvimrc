" vim: set fdm=marker foldenable foldlevel=0 nospell:
" File:          .nvimrc
" Author:        Jacky Alciné <yo@jacky.wtf>
" Description:   The heart for Neovim.
" Last Modified: 2015-01-03 15:51:04 EST
"
" This is my personal setup for NeoVim. It works ~exactly~ the
" way I expect it to. Any different would trip me up.

" {{{ Plugin Managers

" Set up vim-plug ▶️ https://github.com/junegunn/vim-plug#example

call plug#begin('~/.nvim/plugins')

Plug 'benekastah/neomake'
Plug 'bruno-/vim-man', { 'on': 'Man' }
Plug 'janko-m/vim-test'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter', { 'on': 'NERDComment' }

" Code to execute when the plugin is loaded on demand
Plug 'Valloric/YouCompleteMe', { 'for': 'cpp' }
autocmd! User YouCompleteMe call youcompleteme#Enable(

call plug#end()

" }}}

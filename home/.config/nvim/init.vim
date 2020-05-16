" File:          init.vim
" Author:        Jacky Alcine <yo@jacky.wtf>
" Description:   An annotated setup for my editing experience with Vim.
" Last Modified: 2020-05-16 03:48:13 PDT
"
" This file is what Neovim uses to prepare an environment for me to begin work
" on whatever (code, configuration files, you name it). There's some
" expectation of understanding around some core Vim concepts. I'm happy to
" expand on them over e-mail or by opening an issue on the tracker at
" <https://git.jacky.wtf/me/vimrc>.

" {{{ adjustments
" These options are relatively straightforward. I recommend doing a `:help`
" with each option to learn more about them.
"
" Avoid repeating information about the current mode in the status line. I can
" already see that.
set noshowmode

if has('termguicolors') " {{{2 Improve terminal colors
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif " 2}}}

set expandtab
set shiftround
set shiftwidth=2  " Adjusts the width of an auto identation to be 2 spaces.
set softtabstop=2 " This converts <TAB> inserts into (2) spaces
set tabstop=2     " Each <TAB> is represented as 2 spaces.

" Hide markers used to accentuate text until I decide to select or edit it.
set conceallevel=3 concealcursor=nc

" Correct my English spelling.
set spell spelllang=en_us

" Show the matching pair of a bracket, parenthesis or the like.
set showmatch

" Incrementally show matches for a search in a preview window.
set inccommand="split"

" Always show the sign column.
set signcolumn=yes

" Set the pop up menu to be at least 30 x 10
set pumheight=10 pumwidth=30

" Set the Insert mode completion menu to show even if there's only one match.
" It won't automatically select the option for me. Preview information about
" said match.
set completeopt=menu,menuone,noselect,preview

" Wait a tenth of a second to do recovery saving.
set updatetime=100
" }}}

" {{{ abbreviations
" There's things I tend to type that I shouldn't have to explicit type out. Like
" my name.
iabbrev myemail yo@jacky.wtf
iabbrev myname Jacky Alciné
iabbrev me_fname Jacky
iabbrev me_lname Alciné
iabbrev me_site https://jacky.wtf
" }}}

" {{{ state management of files
" Here's some stuff I use to make sure I can get some time traveling in the
" files I interact. I haven't found something this advanced in other file
" editors - definitely one of Vim's top features [undo branching].
"
" Read https://vim.fandom.com/wiki/Using_undo_branches for more information.
"
" Enable undo files. It writes to a sane location by default.
set undofile

" Allow backups to be written and do it before we actually save files.
set backup writebackup

" Disable the use of swapfiles - it's not necessary (IMO) when we have undo
" _and_ backups after.
set noswapfile

" Show me the line I'm on, while having the numbers above and below it be
" numbered in ascending and descending order (relatively counted). Also
" highlight the line I'm on.
set number numberwidth=5 relativenumber cursorline
" }}}

" {{{ plugins
" I lean on using vim-plug[1]; it's Git-backed, snapshot-friendly and allows for
" lazy loading of plugins. Below, I explicitly state how the plugins come from
" GitHub. I do this as to avoid implicit assumption that GitHub is the source of
" truth when it comes to all things code (it's not despite what their marketing
" team wants you to believe).
"
" [1]: https://github.com/junegunn/vim-plug
"
" Call the plug-in manager; already pre-installed.
call plug#begin('~/.config/nvim/plugged')

" Icons for ... everything!
Plug 'https://github.com/ryanoasis/vim-devicons'

" Provides a suite of color schemes based on the base16 palette. I use that
" system on all of my machines.
Plug 'https://github.com/chriskempson/base16-vim'

" A purely cosmetic but life saver for visualizing how formatting is laid out in
" a file.
Plug 'https://github.com/Yggdroot/indentLine'

" Provides a 'splash' screen that can be tweaked to show useful things like the
" last files I've open, launch sessions for projects and more.
Plug 'https://github.com/mhinz/vim-startify'

" Provides a method for realigning text for equidistant spacing.
Plug 'https://github.com/junegunn/vim-easy-align'

" This is a contentious thing to set. I didn't want a heavy plug-in but I also
" don't want to do a lot of configuration. The status-line is the heartbeat of
" what you determine your editor to be in. It's important for it to show the
" right information at the right time.
Plug 'https://github.com/vim-airline/vim-airline'
      \ | Plug 'https://github.com/vim-airline/vim-airline-themes' " Provides themes for the aforementioned plug-in.
" 2}}}

" A super-fast and powerful fuzzy finder for any kind of resource. The
" extensibility of this plug-in makes it a critical part of my setup.
" Information on how to use the finder is mentioned in its README:
" https://github.com/junegunn/fzf#using-the-finder
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }

" A tool for visualizing the undo branching.
Plug 'https://github.com/mbbill/undotree'

" Powerful yet abstract tool for defining a project's structure and tasks for
" it. I can write a whole post about how projections can provide a lean and
" effective means for defining projects in different editors.
Plug 'https://github.com/tpope/vim-projectionist'

" This allows for the repeating of commands using Vim's default approach for
" it. This extends the power of things like vim-easy-align.
Plug 'https://github.com/tpope/vim-repeat'

" To be honest, I recommend just going to the project page and reading it
" directly. This plug-in provides simple yet powerful bindings for using Git in
" vim and is the backbone for other Git-centric plugins.
Plug 'https://github.com/tpope/vim-fugitive'
      \ | Plug 'https://github.com/tpope/vim-rhubarb' " Adds extended support for GitHub into the commands.

" Now, with projectionist set up, leveraging the ease of use of FZF will make
" discovery of projects, files and the like _so_ much easier especially on
" foreign but commonly structured code bases.
Plug 'https://github.com/c-brenn/fuzzy-projectionist.vim'

" Vim has a 'compiler' system - this extends it with your environment; running
" it in the way that makes sense (tmux, internal terminal, etc).
Plug 'https://github.com/tpope/vim-dispatch'

" Linting, fixing and light language client support are all important features
" of someone working across multiple languages. ALE does a great job of being a
" useful tool for handling all three.
Plug 'https://github.com/dense-analysis/ale'

" In order to handle languages as I discover them (I occasionally tinker with
" different languages outside of my wheel house to keep the blades sharp),
" having automatic support them is key. This plug-in covers enough to get me
" where I need to go with highlighting, file-type detection and formatting.
Plug 'https://github.com/sheerun/vim-polyglot'

" EditorConfig support for Vim to keep things nice across editors. You should
" have this for your particular editor and set it up for your project!
Plug 'https://github.com/editorconfig/editorconfig-vim'

" This automatically changes the working directory of the current buffer I'm in
" to be that of the (estimated) project's root directory. Very helpful for
" triggering things like project setup and making file search easier.
Plug 'https://github.com/airblade/vim-rooter'

" A super handy side panel for handling common Git operations.
Plug 'https://github.com/sodapopcan/vim-twiggy'

" Something I don't do often but see value in is being able to view and see
" package information for projects. This works primarily for Node projects,
" however.
Plug 'https://github.com/meain/vim-package-info', { 'do': 'npm install' }

" Provides a way to load configuration into Vim on a per-directory basis. This
" helps out a lot when wanting to inject secrets for testing, adjusting
" configuration and the like.
Plug 'https://github.com/embear/vim-localvimrc'

" I love HTML. I hate typing it out. Emmet is something you should have to
" make the act of typing out HTML a lot more easier.
Plug 'https://github.com/mattn/emmet-vim'

" This provides a pop-up menu for giving Git commit information about the
" current line of code as well as potentially showing a diff at its insertion.
" Super useful for me!
Plug 'https://github.com/rhysd/git-messenger.vim'

" Provides a no-frills, distraction mode for neovim. Very useful when I do
" screencasts, pair or need to demonstrate code. It's also useful when keeping
" Vim in a 'low power' mode.
Plug 'https://github.com/junegunn/goyo.vim'

" Provides instantaneous feedback about the VCS state of the current file.
Plug 'https://github.com/mhinz/vim-signify'

" Provides an abstraction over common testing frameworks for code.
Plug 'https://github.com/janko/vim-test'

" Provides mappings and logic for commenting out code regardless of the
" language.
Plug 'https://github.com/tpope/vim-commentary'

" Extensibility to `netrw`, the file explorer built into Vim.
Plug 'https://github.com/tpope/vim-vinegar'

" Language Server engine. The documentation of the project does it way more justice.
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

" Loads environment file information from disk.
Plug 'https://github.com/tpope/vim-dotenv'
      \ | Plug 'https://github.com/direnv/direnv.vim'

" Enhancements for vim depending on the terminal it's in.
Plug 'https://github.com/wincent/terminus'

" A tool for handling convenient layouts with Fugitive support.
Plug 'https://github.com/vrybas/vim-flayouts'

" Provides a mode modern patching interface.
Plug 'https://github.com/junkblocker/patchreview-vim'

" Provides a means of handling code reviews from GitHub in Vim.
Plug 'https://github.com/codegram/vim-codereview'

call plug#end()
" }}}

" Source in the generated file for the base16 theme.
if filereadable(expand('~/.vimrc_background')  )
  source ~/.vimrc_background
end

" {{{ mappings
" I won't provide _detailed_ explainers for each commands as the definiton of
" them are a bit self explanatory. It does assume you understand how commands
" work in Vim. Check `:help user-commands` for a bit more information.
let s:mappings = {
      \ 'leader':  ',',
      \ 'localLeader':  '\\',
      \ }
exec 'let g:mapleader="' . s:mappings.leader . '"'
exec 'let g:maplocalleader="' . s:mappings.localLeader. '"'

" {{{ mapping block for using <TAB> to nagivate the pop-up menu
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" }}}

" A function to define mappings in bulk. I came across this approach to help
" keep the definition of the mapping memorable as well as making it easy to
" read in the configuration.
func! s:apply_bulk_mappings(mappings_list, opts) abort " {{{
  for l:a_mapping in a:mappings_list
    let l:command = l:a_mapping[0]
    let l:map_format = 'map'

    if has_key(a:opts, 'prefix')
      let l:command = a:opts.prefix . l:command
    endif

    if has_key(a:opts, 'remap')
      let l:map_format = 'noremap'
    endif

    if has_key(a:opts, 'silent')
      let l:map_format .= ' <silent>'
    endif

    let l:modes = get(l:a_mapping, 2, 'n')
    let l:idx = 0
    while l:idx < len(l:modes)
      let l:mode = l:modes[l:idx : 1]
      let l:exc_cmd = l:mode . l:map_format
            \ . s:mappings.leader . l:command
            \ . ' '
            \ . get(l:a_mapping, 1)
      exec l:exc_cmd
      let l:idx += 1
    endwhile
  endfor
endfunc " }}}

vnoremap <Enter> <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" Bulk mappings for interacting with Git.
call <SID>apply_bulk_mappings([
      \ ['C', ':Gcommit --branch --verbose %<CR>'],
      \ ['P', ':Gpush<CR>'],
      \ ['b', ':Gbrowse<CR>'],
      \ ['c', ':Gcommit<CR>'],
      \ ['rm', ':Gremove %<CR>'],
      \ ['rmc', ':Gremove --cached %<CR>'],
      \ ['t', ':Twiggy<CR>'],
      \ ['x', ':Glabort<CR>'],
      \ ['m', ':GitMessenger<CR>'],
      \ ['rc', ':GlresolveConflictTab'],
      \ ['mr', ':GlpullRequestSummaryTab']
      \ ], { 'prefix': 'g' })
" }}}


" Bulk mappings for interacting with the fuzzy finder.
call <SID>apply_bulk_mappings([
      \ ['b', ':Buffers<cr>'],
      \ ['c', ':Commits<cr>'],
      \ ['f', ':Files<cr>'],
      \ ['fg?', ':GFiles?<cr>'],
      \ ['fg', ':GFiles<cr>'],
      \ ['h', ':History<cr>'],
      \ ['H', ':Helptags<cr>'],
      \ ['mc', ':call fzf#vim#maps("c", 1)<cr>'],
      \ ['mi', ':call fzf#vim#maps("i", 1)<cr>'],
      \ ['mn', ':call fzf#vim#maps("n", 1)<cr>'],
      \ ['mt', ':call fzf#vim#maps("t", 1)<cr>'],
      \ ['mv', ':call fzf#vim#maps("v", 1)<cr>'],
      \ ['s', ':Snippets<cr>'],
      \ ['t', ':Tags<cr>'],
      \ ['w', ':Windows<cr>']
      \ ], { 'prefix': 's' })

" Bulk mappings for using the linter system.
call <SID>apply_bulk_mappings([
      \ ['n', '<Plug>(ale_next_wrap)'],
      \ ['p', '<Plug>(ale_previous_wrap)'],
      \ ['f', '<Plug>(ale_first)'],
      \ ['l', '<Plug>(ale_last)'],
      \ ['n', '<Plug>(ale_lint)'],
      \ ['x', '<Plug>(ale_fix)'],
      \ ['r', '<Plug>(ale_reset)'],
      \ ], { 'prefix': 'a'})

" Bulk mappings for handling tests.
call <SID>apply_bulk_mappings([
      \ ['t', ':TestNearest<CR>'],
      \ ['f', ':TestFile<CR>'],
      \ ['a', ':TestSuite<CR>'],
      \ ['l', ':TestLast<CR>'],
      \ ['v', ':TestVisit<CR>'],
      \ ], { 'prefix' : 't' })

" Bulk mappings for running compiler commands.
call <SID>apply_bulk_mappings([
      \ ['i', ':Make install<CR>'],
      \ ['b', ':Make build<CR>'],
      \ ['c', ':Make clean<CR>'],
      \ ['<space>', ':Make!<space>'],
      \ ], { 'prefix' : 'm' })

" {{{ mappings for coc.nvim
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup coc_nvim
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <C-l> for trigger snippet expand.
inoremap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for both expand and jump (make expand higher priority.)
inoremap <C-j> <Plug>(coc-snippets-expand-jump)
" }}}

" {{{ plugin options
" These are tweaks to the plug-ins I use. If they don't have documentation
" (please document your code!) then I try to add a bit around it below.
let g:twiggy_enable_remote_delete = 1
let g:ale_fix_on_save = 1
let g:airline_power_fonts = 1
let g:airline#theme = 'base16'
let g:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 1
let g:airline_focuslost_inactive = 1
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<c-k>'
" }}}


" Optimize how the fuzzy finder looks at the bottom of the screen.
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
end

" Tell the fuzzy finder to leverage ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --silent --hidden'
  set grepprg=rg\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

filetype plugin indent on
syntax on

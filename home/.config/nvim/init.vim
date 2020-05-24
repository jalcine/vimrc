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
"
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
set shiftwidth=2  " Adjusts the width of an auto indentation to be 2 spaces.
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

" Always show the sign column. This prevents a janky experience when signs
" _are_ inserted. We'd also want it to show with at most 3 signs in one line.
set signcolumn=yes:2

" Set the pop up menu to be at least 30 x 10
set pumheight=6 pumwidth=30

" Set the Insert mode completion menu to show even if there's only one match.
" It won't automatically select the option for me. Preview information about
" said match.
set completeopt=menu,menuone,noselect,preview

" Wait a tenth of a second to do recovery saving.
set updatetime=100

" Fold code regions automatically and hide them by default.
set foldenable foldcolumn=2 foldminlines=5 foldmethod=syntax
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

" Don't bother with writing backups.
set nobackup nowritebackup

" Disable the use of swapfiles - it's not necessary (IMO) when we have undo
" _and_ backups after.
set noswapfile updatecount=0

" Show me the line I'm on, while having the numbers above and below it be
" numbered in ascending and descending order (relatively counted). Also
" highlight the line I'm on.
set number numberwidth=2 relativenumber cursorline

" Tell the fuzzy finder to leverage ripgrep
set grepprg=rg\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ --vimgrep
set grepformat=%f:%l:%c:%m
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
" Call the plug-in manager; already pre-installed (as in, the file for this
" plug-in file should already be at $HOME/.config/nvim/autoload/plug.vim
call plug#begin(expand('~/.config/nvim/plugged'))

" Icons for ... everything!
Plug 'https://github.com/ryanoasis/vim-devicons'

" Provides a suite of color schemes based on the base16 palette. I use that
" system on all of my machines.
Plug 'https://github.com/chriskempson/base16-vim'

" A purely cosmetic but life saver for visualizing how formatting is laid out in
" a file.
Plug 'https://github.com/Yggdroot/indentLine'

" Provides a 'splash' screen that can be tweaked to show useful things like the
" last files I've open, launch sessions for projects and more. It also has
" some session management wrappers so I can switch between project themes
" pretty quickly.
Plug 'https://github.com/mhinz/vim-startify'

" Provides a method for realigning text for equidistant spacing. This is how I
" re-align the spaces for the mapping below but also for Markdown tables and
" in CSV files.
Plug 'https://github.com/junegunn/vim-easy-align'

" This is a contentious thing to set. I didn't want a heavy plug-in but I also
" don't want to do a lot of configuration. The status-line is the heartbeat of
" what you determine your editor to be in. It's important for it to show the
" right information at the right time.
Plug 'https://github.com/vim-airline/vim-airline'
      \ | Plug 'https://github.com/vim-airline/vim-airline-themes' " Provides themes for the aforementioned plug-in.
" 2}}}

" A fuzzy finder written in Rust. Opting to use this over `fzf` since I'm more
" comfortable with debugging Rust and that'll give me an edge when tweaking
" and contributing. More info at https://github.com/lotabout/skim#usage.
Plug 'https://github.com/lotabout/skim', { 'dir': '~/.skim', 'do': './install' }

" This provides some helpers for skim in Vim for things like the command
" history, buffers, windows, help tags - the list goes on.
Plug 'https://github.com/lotabout/skim.vim'

" A tool for visualizing the undo branching. Something I use as I work on text
" to help me know when and where I should probably commit a change. It happens
" live soon it's helpful that way.
Plug 'https://github.com/mbbill/undotree'

" Powerful yet abstract tool for defining a project's structure and tasks for
" it. I can write a whole post about how projections can provide a lean and
" effective means for defining projects in different editors.
Plug 'https://github.com/tpope/vim-projectionist'

" This plugin adds operations for actions for manipulating wrapping characters
" like braces, parenthesis and the like. I don't know how I got by without it.
Plug 'https://github.com/tpope/vim-surround'

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
" But in short, this plug-in builds wrappers for the more mature language
" enhancements found in Visual Studio Code for neovim. It's a bit sad to know
" that these changes aren't implemented in a pure LanguageServer approach;
" that we homogenized them around a pseudo-open editor. But the power of
" F/LOSS will always find a way to make things work for the masses.
"
" The extensions for this plug-in are managed at
" $XDG_CONFIG_HOME/coc/extensions.package.json
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}

" Loads environment file information from disk.
Plug 'https://github.com/tpope/vim-dotenv'
      \ | Plug 'https://github.com/direnv/direnv.vim'

" Enhancements for vim depending on the terminal it's in.
Plug 'https://github.com/wincent/terminus'

" A tool for handling convenient layouts with Fugitive support. It adds
" powerful flows for situations like conflict resolution, writing out commits
" and checking out code before doing a review.
Plug 'https://github.com/vrybas/vim-flayouts'

" Provides a mode modern patching interface. This is way more intuitive since
" it's closer to the place where the changes occur anyhow.
Plug 'https://github.com/junkblocker/patchreview-vim'

" Provides a means of handling code reviews from GitHub in Vim. GitHub isnt'
" the only VCS system I interact with (viva la actual F/LOSS). However, this
" plugin provides an interface for working with merge requests on GitHub that
" prevents browser tab fatigue.
Plug 'https://github.com/codegram/vim-codereview'

" Provides a binding to open up the documentation tool Zeal for the code in
" reference. I use this in tandem to the language server documentation.
Plug 'KabbAmine/zeavim.vim'

call plug#end()
" }}}

" Source in the generated file for the base16 theme.
if filereadable(expand('~/.vimrc_background')  )
  source ~/.vimrc_background
end

" {{{ mappings
" I won't provide _detailed_ explainers for each commands as the definition of
" them are a bit self explanatory. It does assume you understand how commands
" work in Vim. Check `:help user-commands` for a bit more information.
let s:mappings = {
      \ 'leader':  ',',
      \ 'localLeader':  '\\',
      \ }
exec 'let g:mapleader="' . s:mappings.leader . '"'
exec 'let g:maplocalleader="' . s:mappings.localLeader. '"'

" {{{ mapping block for using <TAB> to navigate the pop-up menu
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
func! s:generate_prefixed_mappings(mappings_list, opts) abort " {{{
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
call <SID>generate_prefixed_mappings([
      \ ['C',   ':Gcommit --branch --verbose %<CR>'],
      \ ['P',   ':Gpush<CR>'],
      \ ['b',   ':Gbrowse<CR>'],
      \ ['c',   ':Gcommit<CR>'],
      \ ['',    ':Git<CR>'],
      \ ['rm',  ':Gremove %<CR>'],
      \ ['rmc', ':Gremove --cached %<CR>'],
      \ ['t',   ':Twiggy<CR>'],
      \ ['x',   ':Glabort<CR>'],
      \ ['m',   ':GitMessenger<CR>'],
      \ ['rc',  ':GlresolveConflictTab'],
      \ ['mr',  ':GlpullRequestSummaryTab']
      \ ], { 'prefix': 'g' })
" }}}
"
" Bulk mappings for interacting with the intelligent language tool.
call <SID>generate_prefixed_mappings([
      \ ['a',       ':call CocList actions'],
      \ ['d',       ':<C-u>CocList diagnostics<cr>'],
      \ ['e',       ':<C-u>CocList extensions<cr>'],
      \ ['c',       ':<C-u>CocList commands<cr>'],
      \ ['o',       ':<C-u>CocList outline<cr>'],
      \ ['j',       ':<C-u>CocNext<cr>'],
      \ ['i',       ':call CocAction("runCommand", "editor.action.organizeImport")<CR>'],
      \ ['k',       ':<C-u>CocPreview<cr>'],
      \ ['f',       ':call <Plug>(coc-format-selected)<CR>'],
      \ ['a',       ':call <Plug>(coc-codeaction-selected)<CR>'],
      \ ['ac',      ':call <Plug>(coc-codeaction)<CR>'],
      \ ['x',       ':call <Plug>(coc-fix-current)<CR>'],
      \ ['S',       ':<C-u>CocList -I symbols<cr>'],
      \ ['A',       ':call <Plug>(coc-codelens-action)<CR>'],
      \ ['R',       ':call <Plug>(coc-rename)<CR>'],
      \ ['F',       ':call CocAction("format")<CR>'],
      \ ['<space>', ':<C-u>CocListResume<cr>']
      \ ], { 'prefix': 'C' })

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <C-l> <Plug>(coc-snippets-expand)
inoremap <C-j> <Plug>(coc-snippets-expand-jump)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" Bulk mappings for interacting with the fuzzy finder.
call <SID>generate_prefixed_mappings([
      \ ['b',   ':Buffers<cr>'],
      \ ['c',   ':Commits<cr>'],
      \ ['f',   ':Files<cr>'],
      \ ['fg?', ':GFiles?<cr>'],
      \ ['fg',  ':GFiles<cr>'],
      \ ['h',   ':History<cr>'],
      \ ['H',   ':Helptags<cr>'],
      \ ['mc',  ':call fzf#vim#maps("c", 1)<cr>'],
      \ ['mi',  ':call fzf#vim#maps("i", 1)<cr>'],
      \ ['mn',  ':call fzf#vim#maps("n", 1)<cr>'],
      \ ['mt',  ':call fzf#vim#maps("t", 1)<cr>'],
      \ ['mv',  ':call fzf#vim#maps("v", 1)<cr>'],
      \ ['t',   ':Tags<cr>'],
      \ ['w',   ':Windows<cr>']
      \ ], { 'prefix': 's' })

" Bulk mappings for using the linter system.
call <SID>generate_prefixed_mappings([
      \ ['n', '<Plug>(ale_next_wrap)'],
      \ ['p', '<Plug>(ale_previous_wrap)'],
      \ ['f', '<Plug>(ale_first)'],
      \ ['l', '<Plug>(ale_last)'],
      \ ['n', '<Plug>(ale_lint)'],
      \ ['x', '<Plug>(ale_fix)'],
      \ ['r', '<Plug>(ale_reset)'],
      \ ], { 'prefix': 'a'})

" Bulk mappings for handling tests.
call <SID>generate_prefixed_mappings([
      \ ['t', ':TestNearest<CR>'],
      \ ['f', ':TestFile<CR>'],
      \ ['a', ':TestSuite<CR>'],
      \ ['l', ':TestLast<CR>'],
      \ ['v', ':TestVisit<CR>'],
      \ ], { 'prefix' : 't' })

" Bulk mappings for running compiler commands.
call <SID>generate_prefixed_mappings([
      \ ['i', ':Make install<CR>'],
      \ ['b', ':Make build<CR>'],
      \ ['c', ':Make clean<CR>'],
      \ ['<space>', ':Make!<space>'],
      \ ], { 'prefix' : 'm' })

" Bulk mappings for using the quick fix window.
call <SID>generate_prefixed_mappings([
      \ ['e', '<ESC>:cnext<CR>'],
      \ ['f', '<ESC>:cfirst<CR>'],
      \ ['l', '<ESC>:clast<CR>'],
      \ ['o', '<ESC>:Copen<CR>'],
      \ ['p', '<ESC>:cprevious<CR>'],
      \ ['x', '<ESC>:cclose<CR>'],
      \ ['X', '<ESC>:windo cclose<CR>'],
      \ ], { 'prefix': 'c' })

" Bulk mappings for the location list window.
call <SID>generate_prefixed_mappings([
      \ ['e', '<ESC>:lnext<CR>'],
      \ ['f', '<ESC>:lfirst<CR>'],
      \ ['l', '<ESC>:llast<CR>'],
      \ ['o', '<ESC>:lwindow<CR>'],
      \ ['p', '<ESC>:lprevious<CR>'],
      \ ['x', '<ESC>:lclose<CR>'],
      \ ['X', '<ESC>:windo lclose<CR>'],
      \ ], { 'prefix': 'l' })

" This should be defaulted in Neovim, lol. These mappings make terminal
" windows operate a bit more like buffers.
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Add some timestamping commands.

inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <silent> <leader>py <C-R>=strftime("%H:%M:%S %Z")<CR>
cnoremap <silent> <leader>py <C-R>=strftime("%H.%M.%S_%Z")<CR>
cnoremap <silent> <leader>pY <C-R>=strftime("%H.%M.%S")<CR>
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d %H:%M:%S %Z")<CR>
cnoremap <silent> <leader>pt <C-R>=strftime("%Y%m%d%H%M%S")<CR>
inoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>
cnoremap <silent> <leader>pd <C-R>=strftime("%Y-%m-%d")<CR>

autocmd TermOpen * setl nonumber norelativenumber signcolumn=no nofoldenable foldcolumn=0 bufhidden=delete

" {{{ mappings for coc.nvim
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

augroup coc_nvim
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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
" }}}

" {{{ plugin options
" These are tweaks to the plug-ins I use. If they don't have documentation
" (please document your code!) then I try to add a bit around it below.
let g:twiggy_enable_remote_delete = 1
let g:airline#theme = 'base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
let g:airline#extensions#cursormode#enabled = 1
let g:airline#extensions#branch#format = 1
let airline#extensions#coc#error_symbol = ''
let airline#extensions#coc#warning_symbol = ''
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:airline_power_fonts = 1
let g:airline_exclude_preview = 1
let g:airline_skip_empty_sections = 1
let g:airline_highlighting_cache = 1
let g:airline_focuslost_inactive = 1
let g:airline_disable_lsp = 1
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<c-k>'
let g:test#strategy = 'neovim'
" }}}


" Optimize how the fuzzy finder looks at the bottom of the screen.
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
end

filetype plugin indent on
syntax on

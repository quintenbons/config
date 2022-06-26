"" after that copy this file as your ~/.vimrc and execute :PlugInstall

set nocompatible
filetype off

call plug#begin()
Plug 'tpope/vim-sensible' " sane defaults
Plug 'vim-airline/vim-airline' " status bar (needs special fonts)
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox/' " colorscheme
Plug 'tomasr/molokai' " colorscheme compatible with many terminals
Plug 'ryanoasis/vim-devicons' " various symbols (linux, rust, python, ...)

" essential plugins
" see for example https://github.com/autozimu/LanguageClient-neovim/issues/35#issuecomment-288731665
Plug 'maralla/completor.vim' " auto-complete
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ } " as of july 2019 this branch is needed for vim8 (at ensimag, doesn't need it on my pc)


" rust
Plug 'rust-lang/rust.vim' " syntax highlighting
Plug 'mattn/webapi-vim' " used for rust playpen


" not essential
Plug 'tpope/vim-fugitive' " git
Plug 'preservim/nerdtree' " browse files tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy files finding

" snippets allow to easily 'fill' common patterns
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()



filetype plugin indent on

" configure maralla/completor to use tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" ultisnips default bindings compete with completor's tab
" so we need to remap them
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" airline :
" for terminology you will need either to export TERM='xterm-256color'
" or run it with '-2' option
let g:airline_powerline_fonts = 1
set laststatus=2
au VimEnter * exec 'AirlineTheme hybrid'

set encoding=utf-8
set notermguicolors " we disable truecolor display :-( to be compatible with many terminals

syntax on

colo molokai
set background=dark
set number
set hlsearch

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeQuitOnOpen=1

" replace tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" some more rust
let g:LanguageClient_loadSettings = 1 " this enables you to have per-projects languageserver settings in .vim/settings.json
let g:rustfmt_autosave = 1
let g:rust_conceal = 1
set hidden
au BufEnter,BufNewFile,BufRead *.rs syntax match rustEquality "==\ze[^>]" conceal cchar=≟
au BufEnter,BufNewFile,BufRead *.rs syntax match rustInequality "!=\ze[^>]" conceal cchar=≠

" let's autoindent c files
au BufWrite *.c call LanguageClient#textDocument_formatting()

" run language server for python, rust and c
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'python': ['~/.local/bin/pyls'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'],
    \ 'c' : ['clangd'] }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR> " hit :pc to close the preview window
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" clipboard
set clipboard=unnamedplus

" splits to the right
set splitright

" personal mappings
nn , <Nop>
nn ,e :NERDTree<CR>
nn <C-p> Files<CR>
nn ,f :!%:p

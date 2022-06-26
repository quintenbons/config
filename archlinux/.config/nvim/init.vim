" plugs
runtime ./extras/modules.vim

" mappings
runtime ./extras/mappings.vim

" prefs
syntax enable
set nocompatible
set number
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set nobackup
set hlsearch "highlight search pattern
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10 "autoscroll to keep minimal of 10 lines above/below cursor
set expandtab
set backupskip=/tmp/*,/private/tmp/* "no backup file for these patterns
set nowrap
let g:loaded_matchparen = 1

if has('nvim')
  set inccommand=split
endif

" set notermguicolors " for more compatibility (colors)

" indentation
set tabstop=4
set shiftwidth=0
set softtabstop=4
set expandtab
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=0 softtabstop=4

" eye candy
colo molokai
" colo gruvbox

" status bar
let g:airline_powerline_fonts = 1
set laststatus=2
au VimEnter * exec 'AirlineTheme hybrid'

" ultisnips
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeQuitOnOpen=1

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" swap file
set directory=.

" clipboard
set clipboard=unnamedplus

" splits to the right
set splitright

call plug#begin()
" Plug 'tpope/vim-sensible' " sane defaults. Im not sane

" Dependencies
Plug 'nvim-lua/popup.nvim' " Telescope
Plug 'nvim-lua/plenary.nvim' " Telescope

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox/' " colorscheme
Plug 'tomasr/molokai' " colorscheme (compatible with more terminals)

" LSP
Plug 'neovim/nvim-lspconfig' " see cs-lsp
Plug 'williamboman/nvim-lsp-installer' " lsp installer helper
Plug 'folke/lsp-colors.nvim' " LSP color highlight support fix for nvim
Plug 'tami5/lspsaga.nvim' " lsp ui, see cs-lsp
Plug 'maxmellon/vim-jsx-pretty'

" Autocomplete
Plug 'hrsh7th/nvim-cmp' " see cs-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'windwp/nvim-autopairs' " autopair
Plug 'onsails/lspkind-nvim' " add icons to complete menu

" Navigation
Plug 'preservim/nerdtree' " browse files tree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy files finding

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" git
Plug 'tpope/vim-fugitive'
Plug 'samoshkin/vim-mergetool'

call plug#end()

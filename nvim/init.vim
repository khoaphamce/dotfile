set number
set autoindent
set clipboard+=unnamedplus
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

let g:indent_guides_enable_on_vim_startup = 1

set mouse=a

let mapleader = " "

call plug#begin()

Plug 'https://github.com/frazrepo/vim-rainbow'
Plug 'nvim-lualine/lualine.nvim'
Plug 'https://github.com/Townk/vim-autoclose'
Plug 'https://github.com/dense-analysis/ale'
Plug 'vim-syntastic/syntastic'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/sharkdp/fd'
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'lspcontainers/lspcontainers.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'https://github.com/adi/vim-indent-rainbow'
Plug 'yggdroot/indentline'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

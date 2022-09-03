let g:suda_smart_edit = 1
:tnoremap <Esc> <C-\><C-n>
:set number
:set autoindent
:set clipboard+=unnamedplus
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

let g:indent_guides_enable_on_vim_startup = 1

let g:lightline = {
            \   'colorscheme': 'ayu_dark'
            \}

let mapleader = " "

call plug#begin()

Plug 'https://github.com/frazrepo/vim-rainbow'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/Townk/vim-autoclose'
Plug 'https://github.com/dense-analysis/ale'
Plug 'vim-syntastic/syntastic'

Plug 'itchyny/lightline.vim'

Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/sharkdp/fd'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'


" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()


" Vim ariline theme
let g:airline_theme='lighthaus'

let g:syntastic_cpp_check_header = 1
let g:syntastic_c_check_header = 1
let g:indent_guides_auto_colors = 0

" hi IndentGuidesOdd  guibg=red   ctermbg=3
" hi IndentGuidesEven guibg=green ctermbg=4
" let g:indent_color_gui='#ED93E6'
let g:indent_guides_guide_size = 1
let g:indent_guides_tab_guides = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
hi IndentGuidesOdd  ctermbg=253
hi IndentGuidesEven ctermbg=255



"if !exists("no_plugin_maps") && if !hasmapto('<Plug>ToggleRainbow')
"    call togglerb#map("<F8>")
"
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope lsp_document_symbols<cr>

"nvim tree
nnoremap <C-b> <cmd>NvimTreeToggle<cr>
nnoremap <C-n> <cmd>NvimTreeFocus<cr>



" rainbow indent
call togglerb#map("<F9>")

lua << EOF

-- Setup nvim tree
-- examples for your init.lua

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig').pyright.setup {
  --  capabilities = capabilities
  --}
  --require('lspconfig').dockerls.setup {
  --  capabilities = capabilities
  --}
  --require('lspconfig').clangd.setup {
  --  capabilities = capabilities
  --}

  local servers = {'clangd', 'dockerls', 'pyright', 'cssls', 'html', 'quick_lint_js', 'eslint', 'tsserver'}
    for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
                capabilities = capabilities,
                on_attach = on_attach,
        }
    end


--  local lsp_configs = require('lspconfig.configs')
--  lsp_configs.prosemd = {
--    default_config = {
--      -- Update the path to prosemd-lsp
--      cmd = { "~/prosemd-lsp-linux", "--stdio" },
--      filetypes = { "markdown" },
--      root_dir = function(fname)
--        return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
--        end,
--      settings = {}
--    }
--  }


  -- Use your attach function here
EOF

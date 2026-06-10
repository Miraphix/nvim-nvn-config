local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    -- autopairs
    gh('windwp/nvim-autopairs'),

    -- blink.cmp
    {
        src = gh('saghen/blink.cmp'),
        version = vim.version.range("1.*")
    },

    -- bufferline
    gh('akinsho/bufferline.nvim'),

    -- claude
    gh('nvim-lua/plenary.nvim'),
    gh('greggh/claude-code.nvim'),

    -- illuminate
    gh('RRethy/vim-illuminate'),

    -- lazygit
    gh('kdheepak/lazygit.nvim'),

    -- lualine
    gh('nvim-lualine/lualine.nvim'),

    -- lsp
    gh("williamboman/mason.nvim"),
    gh('neovim/nvim-lspconfig'),

    -- monokai theme
    gh('tanvirtin/monokai.nvim'),

    -- nvim-tree*
    gh('nvim-tree/nvim-tree.lua'),
    gh('nvim-tree/nvim-web-devicons'),
    gh('nvim-treesitter/nvim-treesitter'),

    -- render-markdown
    gh('MeanderingProgrammer/render-markdown.nvim'),

    -- toggleterm
    gh('akinsho/toggleterm.nvim'),

    -- vim-transparent
    gh('tribela/vim-transparent'),

    -- which-key
    gh('folke/which-key.nvim'),
})

-- setups
require('plugins.ui')
require('plugins.utils')

require('nvim-tree').setup {}

require('nvim-autopairs').setup {}

require("blink.cmp").setup {
    keymap = { preset = "enter" },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
}

require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 9
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.33
        end
    end,
    -- direction = 'float',
    shade_terminals = false,
}

require('claude-code').setup {}

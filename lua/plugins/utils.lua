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

require("deepseek").setup {
    api_key = "sk-5508a122cab24a789071ef6bb527f0a8",
    api_url = "https://api.deepseek.com/v1",  -- Optional
    keymaps = {
        generate = "<leader>dg",    -- Code generation
        optimize = "<leader>do",    -- Code optimization
        analyze = "<leader>da",     -- Code analysis
        chat = "<leader>dc"         -- AI chat
    },
    max_tokens = 2048,    -- Max tokens per request
    temperature = 0.7,    -- Creativity level
    enable_ui = true,     -- Enable/disable UI elements
    chat = {
        system_prompt = "You are a helpful AI assistant",    -- System prompt for chat
        max_history = 10,    -- Maximum conversation history length
        enable_memory = true,    -- Enable conversation memory
        ui = {
            enable = true,
            position = "float",     -- or "right"
            width = 0.5,            -- float window width ratio
            height = 0.5,           -- float window height ratio
            border = "rounded"      -- window border style
        }
    }
}

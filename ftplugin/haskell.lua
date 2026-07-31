vim.lsp.enable("hls")

vim.opt.tabstop = 2                             -- Tab 键宽度为 2
vim.opt.softtabstop = 2                         -- Tab 键宽度为 2
vim.opt.shiftwidth = 2                          -- 缩进宽度为 2

vim.keymap.set('n', '<leader>rr', '<cmd>Ghci<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gh', '<cmd>Ghci<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gv', '<cmd>Ghciv<CR>', { noremap = true })

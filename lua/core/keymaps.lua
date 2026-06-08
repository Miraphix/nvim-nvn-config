-- map function
local map = vim.keymap.set
vim.g.mapleader = '\\'

local function mapopts(keydesc)
    local opts = { noremap = true, silent = true }
    if (keydesc) then
        opts.desc = keydesc
    end
    return opts
end

local opts = mapopts(nil)

-- 显示时间喵
map('n', '<F2>', ":echo '现在时间是' . strftime('%c') . ' 喵~'<CR>", opts)

-- lsp迁移
map('n', 'gD', vim.lsp.buf.declaration, mapopts("LSP: Declaration"))
map('n', 'gd', vim.lsp.buf.definition, mapopts("LSP: Definition"))
map('n', 'gr', vim.lsp.buf.references, mapopts("LSP: References"))
map('n', 'gk', vim.lsp.buf.hover, mapopts("LSP: Activate Hover"))
map('n', 'gI', vim.lsp.buf.implementation, mapopts("LSP: Implementation"))
map('n', '<c-k>', vim.lsp.buf.signature_help, mapopts("LSP: Signature Help"))
map('n', '<space>f', function() vim.lsp.buf.format { async = true } end, mapopts("LSP: Format"))

map('n', 'D', vim.diagnostic.open_float, mapopts("Open Diagnostic"))
map('n', '<leader>dd', function() vim.diagnostic.setloclist({open = true}) end, mapopts("Open Local Diagnostic"))
map('n', '<leader>dq', function() vim.diagnostic.setqflist({open = true}) end, mapopts("Open All Diagnostic"))

-- terminal设置
-- 结果有toggleterm用了，不赖
map('t', '<c-w>', '<c-\\><c-n><c-w>', opts)
map('n', '<c-\\><c-\\>', ':ToggleTerm<cr>', mapopts("Toggle Term"))
map('t', '<c-\\><c-\\>', '<c-\\><c-n>:ToggleTerm<cr>', mapopts("Toggle Term"))
map('n', '<c-\\>f', ':ToggleTerm direction=float<cr>', mapopts("Toggle Float Term"))
map('n', '<C-\\>h', ':ToggleTerm direction=horizontal<CR>', mapopts("Toggle Horizontal Term"))
map('n', '<C-\\>v', ':ToggleTerm direction=vertical<CR>', mapopts("Toggle Vertival Term"))

-- BufferLine设置
map({'n', 'i'}, '<C-h>', '<Esc>:BufferLineCyclePrev<CR>', opts)
map({'n', 'i'}, '<C-l>', '<Esc>:BufferLineCycleNext<CR>', opts)
map('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', mapopts("Close Other Buffers"))
map('n', '<leader>bd', '<cmd>bdelete<CR>', mapopts("Close This Buffer"))

-- Code-Runner
map('n', '<leader>rr', ':RunCode<CR>', opts)
map('n', '<leader>rc', ':RunClose<CR>', opts)

-- makefile
map('n', '<leader>m ', ':make ', opts)
map('n', '<leader>mm', ':make<CR>', opts)
map('n', '<leader>mc', ':make clean<CR>', opts)
map('n', '<leader>mr', ':make run<CR>', opts)
map('n', '<leader>mf', ':make format<CR>', opts)
map('n', '<leader>md', ':make debug<CR>', opts)
map('n', '<leader>mb', ':make build<CR>', opts)

-- justfile
-- map('n', '<leader>j ', ':MyJustArg ', opts)
-- map('n', '<leader>jj', ':MyJustArg<CR>', opts)
-- map('n', '<leader>ja', ':MyJustArg all<CR>', opts)
-- map('n', '<leader>jc', ':MyJustArg clean<CR>', opts)
-- map('n', '<leader>jr', ':MyJustArg run<CR>', opts)
-- map('n', '<leader>jf', ':MyJustArg format<CR>', opts)
-- map('n', '<leader>jd', ':MyJustArg debug<CR>', opts)
-- map('n', '<leader>jb', ':MyJustArg build<CR>', opts)
-- map('n', '<leader>jt', ':MyJustArg test<CR>', opts)
-- map('n', '<leader>jv', ':MyJustArg run ', opts)

-- 调整窗口大小
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- v模式连续调整缩进
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- 更方便的注释
-- 终端会把/识别为_，为什么呢()
map('v', '<leader>/', ':s/^/', mapopts('manual comment'))

-- 撤回，保存，HJKL
map({'n', 'i', 'v'}, '<C-Z>', '<Esc>u')
map({'n', 'i', 'v'}, '<C-S>', '<Esc>:w<CR>')
map({'n', 'v'}, 'H', '^')
map({'n', 'v'}, 'L', '$')
map('n', 'J', 'j')
map('i', 'jk', '<ESC>')

-- NvimTree
map({'n', 'i'}, '<A-f>', '<Esc>:NvimTreeFocus<CR>', opts)
map({'n', 'i'}, '<A-e>', '<Esc>:NvimTreeToggle<CR>', opts)
map('n', '<leader>q', ':qa<CR>', opts)

-- Lazygit
map('n', '<leader>lg', '<cmd>LazyGit<CR>')


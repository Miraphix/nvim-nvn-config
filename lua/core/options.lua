vim.opt.syntax = 'on'
vim.opt.mouse = 'a'
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = 'utf-8'
vim.opt.cursorline = true                       -- 高亮光标所在行
vim.opt.expandtab = true                        -- 使用空格代替 Tab
vim.opt.tabstop = 4                             -- Tab 键宽度为 4
vim.opt.softtabstop = 4                         -- Tab 键宽度为 4
vim.opt.shiftwidth = 4                          -- 缩进宽度为 4
vim.opt.wrap = true                             -- 自动换行
vim.opt.wrapmargin = 2                          -- 自动换行边距
vim.opt.scrolloff = 8                           -- 上下保留 8 行作为缓冲
vim.opt.signcolumn = "yes"                      -- 永远显示 sign column（诊断标记）
vim.opt.winborder = "rounded"                   -- 窗口边框样式
vim.opt.ignorecase = true                       -- 搜索忽略大小写
vim.opt.smartcase = true                        -- 当包含大写字母时，搜索区分大小写
vim.opt.hlsearch = true                        -- 搜索匹配不高亮
vim.opt.incsearch = true                        -- 增量搜索
vim.opt.foldmethod = "expr"                     -- 折叠方式使用表达式
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- 使用 Treesitter 表达式折叠
vim.opt.foldlevel = 99                          -- 打开文件时默认不折叠
vim.opt.splitbelow = true

-- 配置 win32yank.exe 实现 wsl 与 windows 剪贴板互通
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enable = 0,
}

vim.opt.list = true
vim.opt.listchars = {
    space = "·",    -- 将空格显示为中间点
    tab = "> ",     -- 制表符显示为 "> "
    trail = "-",    -- 行尾空格显示为 "-"
    extends = ">",  -- 超出屏幕右侧的文本显示为 ">"
    precedes = "<", -- 超出屏幕左侧的文本显示为 "<"
}

vim.cmd [[ colo monokai ]]

vim.opt.display:append("uhex")  -- 只在必要时显示十六进制

vim.cmd [[ set guicursor=i:block-iCursor-blinkon0,v:block-vCursor ]]

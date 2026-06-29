-- xmake + toggleterm
vim.api.nvim_create_user_command("MyTermRun", function(input)
    local command = input.args
    vim.cmd(string.format("TermExec cmd='%s'", command))
end, {nargs = '?', desc = 'Run command in the terminal'})

vim.api.nvim_create_user_command("MyXMakeArg", function(input)
    local command = input.args
    vim.cmd(string.format("TermExec cmd='xmake %s'", command))
end, {nargs = '?', desc = 'Run xmake command in the terminal'})

-- vim.api.nvim_create_user_command("MyJustArg", function(input)
--     local command = input.args
--     vim.cmd(string.format("TermExec cmd='just %s'", command))
-- end, {nargs = '?', desc = 'Run just command in the terminal'})

vim.api.nvim_create_user_command("MyCargoArg", function(input)
    local command = input.args
    vim.cmd(string.format("TermExec cmd='cargo %s'", command))
end, {nargs = '?', desc = 'Run cargo command in the terminal'})

vim.api.nvim_create_user_command("XmakeCompileCommands", function()
    vim.cmd(string.format("!xmake project -k compile_commands"))
end, {nargs = '?', desc = 'Generate compile_commands.json'})

vim.api.nvim_create_user_command("Ghci", function()
    -- 搜索项目根目录
    local root = vim.fn.finddir('.git', '.;')
    if root ~= '' then
        root = vim.fn.fnamemodify(root, ':h')
    else
        root = vim.fn.getcwd()
    end

    -- 搜索项目配置文件
    local matches = vim.fn.globpath(root, '*.cabal', false, true)
    vim.cmd('split')
    vim.cmd('res 10')
    if #matches > 0 then
        -- 找到cabal项目
        vim.cmd('terminal cabal repl')
    else
        vim.cmd('terminal ghci %')
    end
end, {nargs = '?', desc = 'Open GHCi for this file.'})

vim.api.nvim_create_user_command("Ghciv", function()
    -- 搜索项目根目录
    local root = vim.fn.finddir('.git', '.;')
    if root ~= '' then
        root = vim.fn.fnamemodify(root, ':h')
    else
        root = vim.fn.getcwd()
    end

    -- 搜索项目配置文件
    local matches = vim.fn.globpath(root, '*.cabal', false, true)
    vim.cmd('vsplit')
    vim.cmd('vertical:res 40')
    if #matches > 0 then
        -- 找到cabal项目
        vim.cmd('terminal cabal repl')
    else
        vim.cmd('terminal ghci %')
    end
end, {nargs = '?', desc = 'Open GHCi for this file.'})

vim.api.nvim_create_user_command("ToggleHLSearch", function()
    -- Why can't I use NOT?
    -- Why the Boolean options are tables?
    local state = vim.opt.hlsearch
    if state._value then
        vim.opt.hlsearch = false
    else
        vim.opt.hlsearch = true
    end
end, {nargs = '?', desc = 'Toggle hlsearch option'})

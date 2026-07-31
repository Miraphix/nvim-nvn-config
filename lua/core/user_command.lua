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

-- 搜索项目根目录
local function find_git_root()
    ---@type string
    local root = vim.fn.finddir('.git', '.;')
    if root ~= '' then
        root = vim.fn.fnamemodify(root, ':h')
    else
        root = vim.fn.getcwd()
    end
    return root
end

local function terminal_cmd(cmd, vsplit)
    if vsplit then
        vim.cmd('vsplit')
        vim.cmd('vertical:res 40')
    else
        vim.cmd('split')
        vim.cmd('res 10')
    end
    if cmd then
        vim.cmd('terminal ' .. cmd)
    end
end

local function project_run(configfile, cmd1, cmd0, vsplit)
    -- 搜索项目根目录
    local root = find_git_root()

    -- 搜索项目配置文件
    local matches = vim.fn.globpath(root, configfile, false, true)
    if #matches > 0 then
        -- 找到cabal项目
        terminal_cmd(cmd1, vsplit)
    else
        terminal_cmd(cmd0, vsplit)
    end
end

vim.api.nvim_create_user_command("Ghci", function()
    project_run("*.cabal", "cabal repl", "ghci %")
end, {nargs = '?', desc = 'Open GHCi for this file.'})

vim.api.nvim_create_user_command("Ghciv", function()
    project_run("*.cabal", "cabal repl", "ghci %", true)
end, {nargs = '?', desc = 'Open GHCi for this file.'})

vim.api.nvim_create_user_command("UVRunThisFile", function()
    project_run("pyproject.toml", "uv run %")
end, {nargs = '?', desc = 'Run this file with uv project.'})

vim.api.nvim_create_user_command("UVRunTaskRun", function()
    project_run("pyproject.toml", "uv run task run")
end, {nargs = '?', desc = 'Run taskipy task'})

vim.api.nvim_create_user_command("TerminalMake", function(input)
    project_run("Makefile", 'make' .. input.args)
end, {nargs = '?', desc = 'Make'})

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

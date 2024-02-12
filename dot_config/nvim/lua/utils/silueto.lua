local M = {}

local global = require("core.global")
local path_sep = global.path_sep

local file_name = table.concat({ vim.fn.expand("$obsidian_vault_path"), "tasks.md" }, path_sep)
local task_file = io.open(file_name, "r")
if not task_file then
    return error("Unable to open" .. file_name)
end
for line in task_file:lines("L") do
    -- 定義ファイルにおいてコメントアウト箇所は不要箇所を示すので削除
    if not string.match(line, "^//") then
        print(line)
    end
end
task_file:close()

return M

--[[
TODO:

繰り返しタスク

]]

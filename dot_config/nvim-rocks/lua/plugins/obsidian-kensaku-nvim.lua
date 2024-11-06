--- enabled check
--- 2. and if executable cmigemo command
---@return boolean
local enabled = function()
    local has_cmigemo = (1 == vim.fn.executable("cmigemo")) and true or false
    return has_cmigemo
end

---@type boolean
local use_denops = require("config.settings").use_denops

---@type table
local opts = {
    query_filter = use_denops and "kensaku" or "cmigemo",
    cmigemo_executable = use_denops and nil or "cmigemo",
    picker = "egrepify",
}

require("obsidian-kensaku").setup(opts)

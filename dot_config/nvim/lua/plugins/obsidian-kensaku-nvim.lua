--- enabled check
--- 2. and if executable cmigemo command
---@return boolean
local enabled = function()
    local has_cmigemo = (1 == vim.fn.executable("cmigemo")) and true or false
    return has_cmigemo
end

---@type table
local opts = {
    query_filter = "cmigemo",
    cmigemo_executable = "cmigemo",
    picker = "egrepify",
}

---@type LazySpec
local spec = {
    "delphinus/obsidian-kensaku.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = "ObsidianKensaku",
    event = "VeryLazy",
    dependencies = { "fdschmidt93/telescope-egrepify.nvim" },
    opts = opts,
    cond = enabled,
    enabled = enabled,
}

return spec

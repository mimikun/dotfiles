-- HACK: disable temporary
---@type string
--local cmigemo_bin = require("config.global").is_windows and "cmigemo.exe" or "cmigemo"

--- If executable cmigemo command
--local enabled = require("utils").is_executable({ cmigemo_bin })
local enabled = false

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

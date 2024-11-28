--- If executable cmigemo command
local enabled = require("utils.is_executable").is_executable({ "cmigemo" })

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

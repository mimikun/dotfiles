---@type table
local opts = {
    dir = table.concat({ vim.fn.stdpath("state"), "sessions" }, require("core.global").path_sep),
}

---@type LazySpec
local spec = {
    "folke/persistence.nvim",
    --lazy = false,
    event = "BufReadPre",
    opts = opts,
    --cond = false,
}

return spec

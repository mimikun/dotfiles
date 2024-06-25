---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type table
local dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "romgrk/barbar.nvim",
    version = "^1.0.0",
    --lazy = false,
    event = events,
    dependencies = dependencies,
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        animation = true,
    },
    cond = false,
}

return spec

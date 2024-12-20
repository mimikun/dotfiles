---@type LazySpec[]
local dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
}

---@type table
local opts = {
    enabled = true,
    disabled_filetypes = require("plugins.hardtime-nvim.disabled_filetypes"),
}

---@type LazySpec
local spec = {
    "m4xshen/hardtime.nvim",
    --lazy = false,
    cmd = "Hardtime",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec

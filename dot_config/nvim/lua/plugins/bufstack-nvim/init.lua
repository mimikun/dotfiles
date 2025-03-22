---@type table
local opts = {
    max_tracked = 16,
}

---@type LazySpec
local spec = {
    "BibekBhusal0/bufstack.nvim",
    --lazy = false,
    cmd = require("plugins.bufstack-nvim.cmds"),
    keys = require("plugins.bufstack-nvim.keys"),
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec

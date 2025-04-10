---@type LazySpec
local spec = {
    "miroshQa/debugmaster.nvim",
    --lazy = false,
    keys = require("plugins.debugmaster-nvim.keys"),
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec

---@type LazySpec
local spec = {
    "hrsh7th/nvim-swm",
    --lazy = false,
    opts = {},
    keys = require("plugins.nvim-swm.keys"),
    cond = false,
    enabled = false,
}

return spec

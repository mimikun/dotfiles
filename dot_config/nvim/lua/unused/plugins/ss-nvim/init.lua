---@type LazySpec
local spec = {
    "4thwithme/ss.nvim",
    name = "ss.nvim",
    --lazy = false,
    keys = require("plugins.ss-nvim.keys"),
    dependencies = { "mikew/nvim-drawer" },
    opts = require("plugins.ss-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec

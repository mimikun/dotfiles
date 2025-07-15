---@type LazySpec
local spec = {
    "m4xshen/hardtime.nvim",
    lazy = false,
    cmd = "Hardtime",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = require("plugins.hardtime-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

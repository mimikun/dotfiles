---@type LazySpec
local spec = {
    "vuki656/package-info.nvim",
    --lazy = false,
    event = { "BufRead package.json" },
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = require("plugins.package-info-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

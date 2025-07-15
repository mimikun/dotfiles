---@type LazySpec
local spec = {
    "KoolieAid/pastevim.nvim",
    --lazy = false,
    cmd = "Pastevim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.pastevim-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

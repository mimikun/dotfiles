---@type LazySpec
local spec = {
    "josephburgess/nvumi",
    --lazy = false,
    cmd = "Nvumi",
    dependencies = { "folke/snacks.nvim" },
    opts = require("plugins.nvumi.opts"),
    cond = false,
    enabled = false,
}

return spec

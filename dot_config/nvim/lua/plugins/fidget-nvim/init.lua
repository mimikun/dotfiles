---@type LazySpec
local spec = {
    "j-hui/fidget.nvim",
    lazy = false,
    cmd = "Fidget",
    opts = require("plugins.fidget-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

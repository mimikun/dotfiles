---@type LazySpec
local spec = {
    "rachartier/tiny-glimmer.nvim",
    --lazy = false,
    cmd = "TinyGlimmer",
    event = "TextYankPost",
    opts = require("plugins.tiny-glimmer-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

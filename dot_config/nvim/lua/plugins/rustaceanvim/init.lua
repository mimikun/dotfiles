---@type LazySpec
local spec = {
    "mrcjkb/rustaceanvim",
    version = "^5",
    -- NOTE: rustaceanvim is already lazy
    lazy = false,
    cmd = require("plugins.rustaceanvim.cmds"),
    --cond = false,
    --enabled = false,
}

return spec

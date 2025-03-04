---@type LazySpec
local spec = {
    "FluxxField/smart-motion.nvim",
    --lazy = false,
    keys = require("plugins.smart-motion-nvim.keys"),
    opts = require("plugins.smart-motion-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec

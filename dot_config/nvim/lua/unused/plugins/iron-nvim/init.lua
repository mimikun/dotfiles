---@type LazySpec
local spec = {
    "Vigemus/iron.nvim",
    --lazy = false,
    cmd = require("plugins.iron-nvim.cmds"),
    keys = require("plugins.iron-nvim.keys"),
    config = function()
        require("iron.core").setup(require("plugins.iron-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec

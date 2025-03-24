---@type LazySpec
local spec = {
    "soulis-1256/eagle.nvim",
    --lazy = false,
    cmd = require("plugins.eagle-nvim.cmds"),
    keys = require("plugins.eagle-nvim.keys"),
    init = function()
        --vim.opt.mousemoveevent = true
        vim.opt.mousemoveevent = false
    end,
    opts = require("plugins.eagle-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec

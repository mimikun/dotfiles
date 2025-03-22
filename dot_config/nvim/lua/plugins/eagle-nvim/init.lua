---@type LazySpec
local spec = {
    "soulis-1256/eagle.nvim",
    --lazy = false,
    cmd = require("plguins.eagle-nvim.cmds"),
    keys = require("plguins.eagle-nvim.keys"),
    init = function()
        --vim.opt.mousemoveevent = true
        vim.opt.mousemoveevent = false
    end,
    opts = require("plguins.eagle-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec

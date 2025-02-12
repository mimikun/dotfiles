---@type LazySpec
local spec = {
    "uga-rosa/ccc.nvim",
    --lazy = false,
    cmd = require("plugins.ccc-nvim.cmds"),
    event = "BufEnter",
    init = function()
        vim.opt.termguicolors = true
    end,
    opts = require("plugins.ccc-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

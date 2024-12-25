---@type LazySpec
local spec = {
    "lewis6991/hover.nvim",
    lazy = false,
    keys = require("plugins.hover-nvim.keys"),
    config = function()
        require("hover").setup(require("plugins.hover-nvim.opts"))
        -- Mouse support
        vim.opt.mousemoveevent = true
    end,
    --cond = false,
    --enabled = false,
}

return spec

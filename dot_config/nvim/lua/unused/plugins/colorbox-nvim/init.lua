---@type LazySpec
local spec = {
    "linrongbin16/colorbox.nvim",
    -- NOTE: don't lazy load
    lazy = false,
    build = function()
        require("colorbox").update()
    end,
    cmd = "Colorbox",
    --keys = "",
    --event = "VeryLazy",
    dependencies = require("plugins.colorbox-nvim.dependencies"),
    init = function()
        vim.opt.termguicolors = true
    end,
    opts = require("plugins.colorbox-nvim.opts"),
    cond = false,
    enabled = false,
    -- NOTE: load with highest priority
    priority = 1000,
}

return spec

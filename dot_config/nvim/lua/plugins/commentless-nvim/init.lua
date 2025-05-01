---@type LazySpec
local spec = {
    "soemre/commentless.nvim",
    --lazy = false,
    cmd = "Commentless",
    keys = require("plugins.commentless-nvim.keys"),
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    init = function()
        vim.opt.foldminlines = 0
        vim.opt.fillchars = "fold: "
    end,
    opts = require("plugins.commentless-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec

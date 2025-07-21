---@type LazySpec
local spec = {
    "hamidi-dev/org-list.nvim",
    --lazy = false,
    ft = { "org" },
    keys = require("plugins.org-list-nvim.keys"),
    dependencies = { "tpope/vim-repeat" },
    opts = require("plugins.org-list-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

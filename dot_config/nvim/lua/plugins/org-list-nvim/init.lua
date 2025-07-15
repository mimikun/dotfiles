---@type LazySpec
local spec = {
    "hamidi-dev/org-list.nvim",
    --lazy = false,
    ft = { "org", "markdown" },
    keys = require("plugins.org-list-nvim.keys"),
    dependencies = { "tpope/vim-repeat" },
    opts = {},
    cond = false,
    enabled = false,
}

return spec

---@type LazySpec
local spec = {
    "akinsho/org-bullets.nvim",
    --lazy = false,
    ft = "org",
    dependencies = { "nvim-orgmode/orgmode" },
    opts = require("plugins.org-bullets-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

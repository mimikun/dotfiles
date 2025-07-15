---@type LazySpec
local spec = {
    "chipsenkbeil/org-roam.nvim",
    --lazy = false,
    ft = "org",
    dependencies = { "nvim-orgmode/orgmode" },
    opts = require("plugins.org-roam-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec

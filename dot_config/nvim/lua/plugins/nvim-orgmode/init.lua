---@type LazySpec
local spec = {
    "nvim-orgmode/orgmode",
    --lazy = false,
    ft = "org",
    cmd = "Org",
    event = "VeryLazy",
    dependencies = require("plugins.nvim-orgmode.dependencies"),
    config = function()
        require("orgmode").setup(require("plugins.nvim-orgmode.opts"))
        require("org-bullets").setup()
        require("org-mouse").setup()
        require("org-list").setup(require("plugins.nvim-orgmode.org-list-opts"))
    end,
    cond = false,
    enabled = false,
}

return spec

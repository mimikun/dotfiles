---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
}

---@type LazySpec
local spec = {
    "NeogitOrg/neogit",
    --lazy = false,
    cmd = "Neogit",
    dependencies = dependencies,
    opts = require("plugins.neogit.opts"),
    --cond = false,
    --enabled = false,
}

return spec

---@type LazySpec
local spec = {
    "BibekBhusal/nvim-shadcn",
    --lazy = false,
    cmd = "ShadcnAdd",
    keys = require("plugins.nvim-shadcn.keys"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = require("plugins.nvim-shadcn.opts"),
    cond = false,
    enabled = false,
}

return spec

---@type LazySpec
local spec = {
    "maskudo/devdocs.nvim",
    --lazy = false,
    cmd = "DevDocs",
    keys = require("plugins.devdocs-nvim.keys"),
    dependencies = { "folke/snacks.nvim" },
    opts = require("plugins.devdocs-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

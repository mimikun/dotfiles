---@type LazySpec
local spec = {
    "Kurren123/mssql.nvim",
    --lazy = false,
    keys = require("plugins.mssql-nvim.keys"),
    dependencies = { { "folke/which-key.nvim", optional = true } },
    opts = require("plugins.mssql-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec

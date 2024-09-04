---@type table
local opts = {
    sources = require("plugins.configs.none-ls.sources").minimal,
}

---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    --lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = opts,
    --cond = false,
    -- NOTE: null-ls replace plugin `pattern 2`
    --enabled = false,
}

return spec

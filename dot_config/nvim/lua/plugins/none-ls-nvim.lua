---@type boolean
local cond = require("config.settings").use_none_ls

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
    cond = cond,
    enabled = cond,
}

return spec

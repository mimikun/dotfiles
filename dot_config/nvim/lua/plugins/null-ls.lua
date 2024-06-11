---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        ---@type table[]
        local base_sources = {
            windows = require("plugins.sources.null-ls").windows,
            linux = require("plugins.sources.null-ls").linux,
            minimal = require("plugins.sources.null-ls").minimal,
            full = require("plugins.sources.null-ls").full,
        }

        ---@type table
        local sources = base_sources.minimal

        require("null-ls").setup({ sources = sources })
    end,
    --cond = false,
}

return spec

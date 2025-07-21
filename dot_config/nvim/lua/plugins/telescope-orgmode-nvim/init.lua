---@type LazySpec
local spec = {
    "joaomsa/telescope-orgmode.nvim",
    --lazy = false,
    ft = "org",
    event = "VeryLazy",
    dependencies = require("plugins.telescope-orgmode-nvim.dependencies"),
    config = function()
        require("telescope").load_extension("orgmode")
    end,
    cond = false,
    enabled = false,
}

return spec

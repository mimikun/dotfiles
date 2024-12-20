---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "OXY2DEV/markview.nvim",
    lazy = false,
    ft = "markdown",
    cmd = "Markview",
    event = "BufEnter",
    dependencies = dependencies,
    config = function()
        local markview = require("markview")

        markview.setup({
            headings = require("markview.presets").headings.glow_labels,
        })

        -- default off
        markview.commands.disableAll()
    end,
    --cond = false,
    --enabled = false,
}

return spec

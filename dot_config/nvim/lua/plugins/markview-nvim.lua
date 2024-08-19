---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "OXY2DEV/markview.nvim",
    --commit = "3e5ceec5beab5730aa3a730126b229801b449f0f",
    lazy = false,
    --ft = "markdown",
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
    -- NOTE: markdown-render plugin
    --enabled = false,
}

return spec

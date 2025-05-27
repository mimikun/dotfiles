---@type LazySpec
local spec = {
    "OXY2DEV/markview.nvim",
    --branch = "dev",
    --lazy = false,
    ft = "markdown",
    cmd = "Markview",
    event = "BufEnter",
    dependencies = require("plugins.markview-nvim.dependencies"),
    config = function()
        -- NOTE: NEED call setup function
        require("markview").setup(require("plugins.markview-nvim.opts"))
    end,
    --cond = false,
    --enabled = false,
}

return spec

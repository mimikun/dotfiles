---@type LazySpec
local spec = {
    "OXY2DEV/markview.nvim",
    --branch = "dev",
    lazy = false,
    ft = "markdown",
    cmd = "Markview",
    event = "BufEnter",
    dependencies = require("plugins.markview-nvim.dependencies"),
    config = function()
        require("markview").setup(require("plugins.markview-nvim.opts"))

        -- default off
        vim.cmd("Markview Disable")
    end,
    --cond = false,
    --enabled = false,
}

return spec

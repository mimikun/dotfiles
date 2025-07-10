---@type LazySpec
local spec = {
    "quolpr/quicktest.nvim",
    --lazy = false,
    cmd = require("plugins.quicktest-nvim.cmds"),
    keys = require("plugins.quicktest-nvim.keys"),
    dependencies = require("plugins.quicktest-nvim.dependencies"),
    config = function()
        require("quicktest").setup(require("plugins.quicktest-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec

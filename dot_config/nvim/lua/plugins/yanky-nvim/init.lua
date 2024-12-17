---@type LazySpec
local spec = {
    "gbprod/yanky.nvim",
    --lazy = false,
    cmd = "YankyClearHistory",
    keys = require("plugins.yanky-nvim.keys"),
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
        require("yanky").setup(require("plugins.yanky-nvim.opts"))
    end,
    --cond = false,
    --enabled = false,
}

return spec

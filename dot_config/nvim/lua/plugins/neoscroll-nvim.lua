return {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
        local neoscroll = require("neoscroll")
        neoscroll.setup({})
    end,
    --cond = false,
}

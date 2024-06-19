---@type LazySpec
local spec = {
    "slugbyte/lackluster.nvim",
    --lazy = false,
    config = function()
        local lackluster = require("lackluster")

        lackluster.setup({
            tweak_syntax = {
                comment = lackluster.color.gray4,
                --comment = lackluster.color.gray5,
            },
            tweak_background = {
                normal = "none",
                telescope = "none",
                menu = lackluster.color.gray3,
                popup = "default",
            },
        })
    end,
    priority = 1000,
    --cond = false,
}

return spec

---@type LazySpec
local spec = {
    "hrsh7th/nvim-insx",
    lazy = false,
    --keys = "",
    --event = "VeryLazy",
    config = function()
        local insx_preset = require("insx.preset.standard")
        insx_preset.setup({})
    end,
    --cond = false,
}

return spec

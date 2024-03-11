---@type LazySpec
local spec = {
    -- TODO: setting
    "folke/noice.nvim",
    --lazy = false,
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {},
    cond = false,
}

return spec

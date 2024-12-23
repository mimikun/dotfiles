---@type LazySpec
local spec = {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    --lazy = false,
    keys = require("plugins.multicursor-nvim.keys"),
    config = function()
        require("multicursor-nvim").setup()

        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { link = "Cursor" })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
    --cond = false,
    --enabled = false,
}

return spec

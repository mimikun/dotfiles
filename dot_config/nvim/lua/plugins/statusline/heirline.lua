-- TODO: settings
-- https://github.com/rebelot/heirline.nvim/blob/master/cookbook.md

---@type LazySpec
local spec = {
    "rebelot/heirline.nvim",
    --lazy = false,
    event = "UiEnter",
    config = function()
        require("heirline").setup({
            statusline = {},
            winbar = {},
            tabline = {},
            statuscolumn = {},
        })
    end,
    cond = false,
}

return spec

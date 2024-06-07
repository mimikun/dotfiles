---@type table
local keybinds = {
    { "<C-t>", desc = "Use dmacro" },
}

---@type LazySpec
local spec = {
    "tani/dmacro.nvim",
    --lazy = false,
    keys = keybinds,
    --event = "VeryLazy",
    config = function()
        local dmacro = require("dmacro")
        dmacro.setup({
            dmacro_key = "<C-t>",
        })
    end,
}

return spec

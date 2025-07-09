---@type table
local opts = {
    timeout = 4000,
    always_visible = true,
    placement = "bottom",
}

---@type LazySpec
local spec = {
    "keithetruesdell/combo-mode.nvim",
    --lazy = false,
    --event = "VeryLazy",
    config = function()
        local combo_mode = require("combo-mode")
        combo_mode.setup(opts)

        combo_mode.on(5, function()
            vim.api.nvim_echo({ { "🔥 Combo x5!", "WarningMsg" } }, false, {})
        end)

        combo_mode.on(10, function()
            vim.api.nvim_echo({ { "🔥 Combo x10!", "WarningMsg" } }, false, {})
        end)
    end,
    cond = false,
    enabled = false,
}

return spec

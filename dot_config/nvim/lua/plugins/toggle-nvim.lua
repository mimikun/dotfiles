---@type ToggleOption
local opts = {
    keymaps = {
        toggle_option_prefix = "<leader>yo",
        previous_option_prefix = "[o",
        next_option_prefix = "]o",
        status_dashboard = "<leader>yd",
    },
}

---@type LazySpec
local spec = {
    "gregorias/toggle.nvim",
    version = "2.0",
    --lazy = false,
    event = "VeryLazy",
    opts = opts,
    --cond = false,
}

return spec

---@type ToggleOption
local opts = {
    keymaps = {
        toggle_option_prefix = "<leader>yo",
        previous_option_prefix = "[o",
        next_option_prefix = "]o",
        status_dashboard = "<leader>yd",
    },
}

require("toggle").setup(opts)

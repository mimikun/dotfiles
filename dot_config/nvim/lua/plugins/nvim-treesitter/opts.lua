---@type table
local opts = {
    highlight = {
        enable = true,
        disable = {},
    },
    ensure_installed = require("plugins.nvim-treesitter.parsers"),
    -- NOTE:
    -- If your human rights are being violated,
    -- you will need to repeatedly press the Enter-key during initial setup.
    sync_install = not require("config.global").is_human_rights,
    textsubjects = {
        enable = true,
        -- (Optional) keymap to select the previous selection
        prev_selection = ",",
        keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["i;"] = {
                "textsubjects-container-inner",
                desc = "Select inside containers (classes, functions, etc.)",
            },
        },
    },
}

return opts

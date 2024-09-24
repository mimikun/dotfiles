---@type LazyKeysSpec[]
local keys = {
    { "<leader>tp", desc = "open_theme_picker" },
}

---@type table
local opts = {
    picker = {
        prompt_title = "Select Theme",
        layout_config = {
            width = 0.35,
            height = 0.5,
        },
    },
    themes = {
        {
            name = "Pastel Night(Dark)",
            colorscheme = "pastelnight",
        },
        {
            name = "Pastel Night(HightContrast)",
            colorscheme = "pastelnight-highcontrast",
        },
        --[[
        {
            name = "Tokyo Night (Night)",
            colorscheme = "tokyonight-night",
        },
        {
            name = "Tokyo Night (Storm)",
            colorscheme = "tokyonight-storm",
        },
        {
            name = "One Dark (Dark)",
            colorscheme = "onedark",
            before = function()
                vim.g.onedark_config = {
                    style = "dark",
                }
            end,
        },
        {
            name = "One Dark (Darker)",
            colorscheme = "onedark",
            before = function()
                vim.g.onedark_config = {
                    style = "darker",
                }
            end,
        },
        ]]
    },
}

---@type LazySpec
local spec = {
    "panghu-huang/theme-picker.nvim",
    lazy = false,
    cmd = "ThemePicker",
    keys = keys,
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local tp = require("theme-picker")

        tp.setup(opts)

        -- open theme picker user command
        vim.api.nvim_create_user_command("ThemePicker", function()
            tp.open_theme_picker()
        end, {})

        -- keybind
        vim.keymap.set("n", "<leader>tp", function()
            tp.open_theme_picker()
        end, { noremap = true, silent = true })
    end,
    cond = false,
    enabled = false,
}

return spec

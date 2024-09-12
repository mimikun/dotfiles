---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>tr",
        desc = "Run randtheme",
    },
}

---@type table
local opts = {
    --exclude_themes = {},
    change_on_startup = true,
    print_theme_name = true,
    change_interval = 1,
    -- Specify a custom directory to search for colorschemes.
    -- If not set, RandTheme will use Neovim's default colorscheme locations.
    --colorscheme_dir = "~/.config/nvim/colors",
    include_builtin_themes = false,
    reroll_keymap = "<leader>tr",
}

---@type LazySpec
local spec = {
    "Styzex/RandTheme.nvim",
    --lazy = false,
    cmd = "RandTheme",
    keys = keys,
    event = "VimEnter",
    --dependencies = dependencies,
    config = function()
        local randtheme = require("randtheme")

        randtheme.setup(opts)

        -- define user command
        vim.api.nvim_create_user_command("RandTheme", function()
            randtheme.setup_daily_theme()
        end, {})
    end,
    cond = false,
    enabled = false,
    priority = 1000,
}

return spec

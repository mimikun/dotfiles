return {
    "zaldih/themery.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = {
        "Themery",
    },
    config = function()
        -- Minimal config
        require("themery").setup({
            -- Your list of installed colorschemes
            themes = {
                "gruvbox",
                "ayu",
            },
            themeConfigFile = "~/.config/nvim/lua/plugins/themes.lua",
            livePreview = true,
        })
    end,
    --cond = false,
}

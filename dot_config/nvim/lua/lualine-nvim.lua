--ref:
--https://raw.githubusercontent.com/numToStr/dotfiles/master/neovim/.config/nvim/lua/numToStr/plugins/lualine.lua
require("lualine").setup({
    options = {
        theme = "auto",
        component_separators = "",
        section_separators = "",
        icons_enabled = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = {
            { "mode", color = { gui = "bold" } },
        },
        lualine_b = {
            { "branch" },
            { "diff", colored = false },
        },
        lualine_c = {
            { "filename", file_status = true },
            { "diagnostics" },
        },
        lualine_x = {
            "filetype",
            "encoding",
            "fileformat",
        },
        lualine_y = { "progress" },
        lualine_z = {
            { "location", color = { gui = "bold" } },
        },
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                buffers_color = { active = "lualine_b_normal" },
            },
        },
        lualine_z = {
            {
                "tabs",
                tabs_color = { active = "lualine_b_normal" },
            },
        },
    },
})

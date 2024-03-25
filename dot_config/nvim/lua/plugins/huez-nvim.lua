---@type table
local omit_themes = {
    "default",
    "desert",
    "evening",
    "industry",
    "koehler",
    "morning",
    "murphy",
    "pablo",
    "peachpuff",
    "ron",
    "shine",
    "slate",
    "torte",
    "zellner",
    "blue",
    "darkblue",
    "delek",
    "quiet",
    "elflord",
    "habamax",
    "lunaperche",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    lazy = false,
    cmd = "Huez",
    --keys = "",
    --event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        local huez = require("huez")
        local huez_api = require("huez.api")

        huez.setup({
            file_path = vim.fs.normalize(vim.fn.stdpath("config")) .. "/.nvim.huez.lua",
            fallback = "default",
            omit = omit_themes,
            -- "vim" or "telescope"
            picker = "telescope",
            picker_opts = require("telescope.themes").get_dropdown({}),
        })
        local colorscheme = huez_api.get_colorscheme()
        vim.cmd.colorscheme(colorscheme)
    end,
    --cond = false,
}

return spec

local global = require("core.global")
local themery_config = global.themery_config
local huez_config = vim.fs.normalize(vim.fn.stdpath("config")) .. "/.nvim.huez.lua"

---@type table
local huez_omit_themes = {
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
local huez = {
    "vague2k/huez.nvim",
    --lazy = false,
    cmd = "Huez",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        local huez = require("huez")
        local huez_api = require("huez.api")

        huez.setup({
            file_path = huez_config,
            fallback = "default",
            omit = huez_omit_themes,
            -- "vim" or "telescope"
            picker = "telescope",
            picker_opts = require("telescope.themes").get_dropdown({}),
        })
        local colorscheme = huez_api.get_colorscheme()
        vim.cmd.colorscheme(colorscheme)
    end,
    cond = false,
}

---@type table
local themery_selectables = {
    -- Lua themes
    {
        name = "github_dark",
        colorscheme = "github_dark",
    },
    {
        name = "cyberdream",
        colorscheme = "cyberdream",
    },
    {
        name = "monokai",
        colorscheme = "monokai",
    },
    {
        name = "penumbra",
        colorscheme = "penumbra",
    },
    {
        name = "tokyonight",
        colorscheme = "tokyonight",
    },
    {
        name = "yash",
        colorscheme = "yash",
    },
    {
        name = "nightfox",
        colorscheme = "nightfox",
    },
    {
        name = "tokyodark",
        colorscheme = "tokyodark",
    },
    {
        name = "monokai_pro",
        colorscheme = "monokai-pro",
    },
    {
        name = "nord",
        colorscheme = "nord",
    },
    {
        name = "catppuccin",
        colorscheme = "catppuccin",
    },
    {
        name = "pastelnight",
        colorscheme = "pastelnight",
    },
    {
        name = "kurayami",
        colorscheme = "kurayami",
    },
    {
        name = "lavi",
        colorscheme = "lavi",
    },
    {
        name = "evergarden",
        colorscheme = "evergarden",
    },
    {
        name = "sunburn",
        colorscheme = "sunburn",
    },
    {
        name = "eldritch",
        colorscheme = "eldritch",
    },
    {
        name = "ariake",
        colorscheme = "ariake",
    },
    {
        name = "abstract",
        colorscheme = "abscs",
    },
    {
        name = "dark_flat",
        colorscheme = "dark_flat",
    },
    {
        name = "everblush",
        colorscheme = "everblush",
    },
    {
        name = "mellow",
        colorscheme = "mellow",
    },
    {
        name = "fluoromachine",
        colorscheme = "fluoromachine",
    },
    {
        name = "srcerite",
        colorscheme = "srcerite",
    },
    {
        name = "oldworld",
        colorscheme = "oldworld",
    },
    {
        name = "lackluster",
        colorscheme = "lackluster",
    },
    -- VimScript themes
    {
        name = "sonokai",
        colorscheme = "sonokai",
    },
    {
        name = "kyotonight",
        colorscheme = "kyotonight",
    },
    {
        name = "momiji",
        colorscheme = "momiji",
    },
    {
        name = "edge",
        colorscheme = "edge",
    },
    {
        name = "dogrun",
        colorscheme = "dogrun",
    },
    --{ name = "gaming", colorscheme = "gaming" },
}

local themery = {
    "zaldih/themery.nvim",
    --lazy = false,
    cmd = "Themery",
    opts = {
        themes = themery_selectables,
        themeConfigFile = themery_config,
        livePreview = true,
    },
    --cond = false,
}

---@type LazySpec[]
local specs = {
    huez,
    themery,
}

return specs

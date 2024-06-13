-- TODO:

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
    {
        name = "kanagawa",
        colorscheme = "kanagawa",
    },
    {
        name = "kanagawa-paper",
        colorscheme = "kanagawa-paper",
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

---@type table
local opts = {
    themes = themery_selectables,
    themeConfigFile = require("core.global").themery_config,
    livePreview = true,
}

---@type LazySpec
local spec = {
    "zaldih/themery.nvim",
    --lazy = false,
    cmd = "Themery",
    opts = opts,
    --cond = false,
}

return spec

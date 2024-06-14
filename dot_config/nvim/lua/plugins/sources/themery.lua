local M = {}

---@type table
M.selectables = {
    --- github_nvim_themes
    {
        name = "github_theme dark default",
        colorscheme = "github_dark",
    },
    {
        name = "github_theme dark colorblind",
        colorscheme = "github_dark_colorblind",
    },
    {
        name = "github_theme dark default 2",
        colorscheme = "github_dark_default",
    },
    {
        name = "github_theme dark dimmed",
        colorscheme = "github_dark_dimmed",
    },
    {
        name = "github_theme dark high contrast",
        colorscheme = "github_dark_high_contrast",
    },
    {
        name = "github_theme dark tritanopia",
        colorscheme = "github_dark_tritanopia",
    },
    {
        name = "github_theme light default",
        colorscheme = "github_light",
    },
    {
        name = "github_theme light colorblind",
        colorscheme = "github_light_colorblind",
    },
    {
        name = "github_theme light default 2",
        colorscheme = "github_light_default",
    },
    {
        name = "github_theme light high contrast",
        colorscheme = "github_light_high_contrast",
    },
    {
        name = "github_theme light tritanopia",
        colorscheme = "github_light_tritanopia",
    },
    {
        name = "github_theme dimmed",
        colorscheme = "github_dimmed",
    },
    --- tokyonight_themes
    {
        name = "tokyonight default",
        colorscheme = "tokyonight",
    },
    {
        name = "tokyonight day",
        colorscheme = "tokyonight-day",
    },
    {
        name = "tokyonight moon",
        colorscheme = "tokyonight-moon",
    },
    {
        name = "tokyonight night",
        colorscheme = "tokyonight-night",
    },
    {
        name = "tokyonight storm",
        colorscheme = "tokyonight-storm",
    },
    --- catppuccin_themes
    {
        name = "catppuccin default",
        colorscheme = "catppuccin",
    },
    {
        name = "catppuccin latte",
        colorscheme = "catppuccin-latte",
    },
    {
        name = "catppuccin frappe",
        colorscheme = "catppuccin-frappe",
    },
    {
        name = "catppuccin macchiato",
        colorscheme = "catppuccin-macchiato",
    },
    {
        name = "catppuccin mocha",
        colorscheme = "catppuccin-mocha",
    },
    --- kanagawa_themes
    {
        name = "kanagawa default",
        colorscheme = "kanagawa",
    },
    {
        name = "kanagawa dragon",
        colorscheme = "kanagawa-dragon",
    },
    {
        name = "kanagawa lotus",
        colorscheme = "kanagawa-lotus",
    },
    {
        name = "kanagawa wave",
        colorscheme = "kanagawa-wave",
    },
    --- monokai_themes
    {
        name = "monokai default",
        colorscheme = "monokai",
    },
    {
        name = "monokai pro",
        colorscheme = "monokai_pro",
    },
    {
        name = "monokai ristretto",
        colorscheme = "monokai_ristretto",
    },
    {
        name = "monokai soda",
        colorscheme = "monokai_soda",
    },
    --- monokai_pro_themes
    {
        name = "monokai-pro default",
        colorscheme = "monokai-pro",
    },
    {
        name = "monokai-pro classic",
        colorscheme = "monokai-pro-classic",
    },
    {
        name = "monokai-pro default 2",
        colorscheme = "monokai-pro-default",
    },
    {
        name = "monokai-pro machine",
        colorscheme = "monokai-pro-machine",
    },
    {
        name = "monokai-pro octagon",
        colorscheme = "monokai-pro-octagon",
    },
    {
        name = "monokai-pro ristretto",
        colorscheme = "monokai-pro-ristretto",
    },
    {
        name = "monokai-pro spectrum",
        colorscheme = "monokai-pro-spectrum",
    },
    --- pastelnight_themes
    {
        name = "pastelnight default",
        colorscheme = "pastelnight",
    },
    {
        name = "pastelnight high contrast",
        colorscheme = "pastelnight-highcontrast",
    },
    --- lackluster_themes
    {
        name = "lackluster default",
        colorscheme = "lackluster",
    },
    {
        name = "lackluster dark",
        colorscheme = "lackluster-dark",
    },
    {
        name = "lackluster hack",
        colorscheme = "lackluster-hack",
    },
    {
        name = "lackluster mint",
        colorscheme = "lackluster-mint",
    },
    {
        name = "lackluster night",
        colorscheme = "lackluster-night",
    },
    --- lua_other_themes
    {
        name = "lavi",
        colorscheme = "lavi",
    },
    {
        name = "sunburn",
        colorscheme = "sunburn",
    },
    {
        name = "srcerite",
        colorscheme = "srcerite",
    },
    {
        name = "tokyodark",
        colorscheme = "tokyodark",
    },
    {
        name = "nord",
        colorscheme = "nord",
    },
    {
        name = "oldworld",
        colorscheme = "oldworld",
    },
    {
        name = "penumbra",
        colorscheme = "penumbra",
    },
    {
        name = "cyberdream",
        colorscheme = "cyberdream",
    },
    {
        name = "mellow",
        colorscheme = "mellow",
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
        name = "kanagawa-paper",
        colorscheme = "kanagawa-paper",
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
        name = "evergarden",
        colorscheme = "evergarden",
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
        name = "kurayami",
        colorscheme = "kurayami",
    },
    {
        name = "fluoromachine",
        colorscheme = "fluoromachine",
    },
    --- vimscript_themes
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
    --- noisy theme
    --[[
    {
        name = "gaming",
        colorscheme = "gaming",
    },
    ]]
}

return M

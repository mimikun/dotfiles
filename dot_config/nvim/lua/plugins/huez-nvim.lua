---@type table
local opts = {
    fallback = "pastelnight",
    theme_config_module = "plugins.configs.huez-nvim.themes",
    exclude = require("plugins.configs.huez-nvim.exclude").exclude,
}

---@type table
local cmds = {
    "Huez",
    "HuezEnsured",
    "HuezLive",
    "HuezFavorites",
}

---@type table
local dependencies = {
    -- main colorscheme
    "pauchiner/pastelnight.nvim",
    -- sub colorscheme
    "folke/tokyonight.nvim",
    -- 'named' colorscheme
    { "catppuccin/nvim", name = "catppuccin", optional = true },
    -- other dependencies
    { "rktjmp/lush.nvim", optional = true },
    { "loganswartz/polychrome.nvim", optional = true },
    { "Iron-E/nvim-highlite", optional = true },
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    dependencies = dependencies,
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec

local global = require("config.global")

---@type string
local data_dir = vim.fn.stdpath("data")

---@type string
local data_path = global.is_windows and data_dir or vim.fs.normalize(data_dir)

---@type Huez.Config
local opts = {
    path = table.concat({ data_path, "huez" }, global.path_sep),
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

---@type LazySpec[]
local dependencies = {
    -- main colorscheme
    "pauchiner/pastelnight.nvim",
    -- sub colorscheme
    "folke/tokyonight.nvim",
    "projekt0n/github-nvim-theme",
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

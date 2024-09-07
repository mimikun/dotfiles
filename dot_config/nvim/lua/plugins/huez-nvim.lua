local global = require("config.global")

---@type string|string[]
local data_dir = vim.fn.stdpath("data")

---@type string
local data_path = global.is_windows and data_dir or vim.fs.normalize(data_dir)

---@type Huez.Config
local opts = {
    path = table.concat({ data_path, "huez" }, global.path_sep),
    fallback = "pastelnight",
    theme_config_module = "plugins.configs.huez-nvim.themes",
    exclude = require("plugins.configs.huez-nvim.exclude"),
}

---@type table
local cmds = {
    "Huez",
    "HuezEnsured",
    "HuezLive",
    "HuezFavorites",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    dependencies = require("plugins.configs.huez-nvim.dependencies"),
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec

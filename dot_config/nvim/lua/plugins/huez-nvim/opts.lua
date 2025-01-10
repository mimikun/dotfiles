local global = require("config.global")

---@type string|string[]
local data_dir = vim.fn.stdpath("data")

---@type string
local data_path = global.is_windows and data_dir or vim.fs.normalize(data_dir)

---@type Huez.Config
local opts = {
    path = table.concat({ data_path, "huez" }, global.path_sep),
    fallback = "pastelnight",
    theme_config_module = "plugins.huez-nvim.themes",
    exclude = require("plugins.huez-nvim.exclude"),
}

return opts

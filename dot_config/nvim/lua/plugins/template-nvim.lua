local global = require("config.global")

---@type table
local opts = {
    temp_dir = table.concat({ global.vim_path, "templates" }, global.path_sep),
}

---@type LazySpec
local spec = {
    "nvimdev/template.nvim",
    --lazy = false,
    cmd = "Template",
    opts = opts,
    --cond = false,
}

return spec

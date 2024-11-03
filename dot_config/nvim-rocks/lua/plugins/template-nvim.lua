local global = require("config.global")

---@type table
local opts = {
    temp_dir = table.concat({ global.vim_path, "templates" }, global.path_sep),
}

require('template').setup(opts)

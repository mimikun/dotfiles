local global = require("config.global")

---@type string
local path_sep = global.path_sep

---@type table
local opts = {
    lazy_path = table.concat({ global.data_dir, "lazy" }, path_sep),
    patches_path = table.concat({ global.vim_path, "patches" }, path_sep),
    update_patches = true,
    apply_patches = true,
    confirm_mass_changes = true,
    print_logs = true,
}

return opts

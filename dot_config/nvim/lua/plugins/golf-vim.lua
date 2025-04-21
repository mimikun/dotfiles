local global = require("config.global")

---@type table
local cmds = {
    "Golf",
    "GolfToday",
}

---@type string
local golf_data_dir = table.concat({ global.cache_dir, "vim-golf" }, global.path_sep)

---@type string
local golf_challenges_dir = table.concat({ golf_data_dir, "challenges" }, global.path_sep)

---@type LazySpec
local spec = {
    "vuciv/golf",
    --lazy = false,
    cmd = cmds,
    config = function()
        vim.g.golf_data_dir = golf_data_dir
        vim.g.golf_challenges_dir = golf_challenges_dir
    end,
    cond = false,
    enabled = false,
}

return spec

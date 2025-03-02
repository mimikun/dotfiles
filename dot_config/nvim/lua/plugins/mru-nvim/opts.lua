---@type string
local mru_cache_file = table.concat({
    vim.fn.stdpath("data"),
    "nvim-mru.json",
}, require("config.global").path_sep)

---@type table
local opts = {
    enable_cache = true,
    mru_cache_file = mru_cache_file,
    events = {
        "BufEnter",
        "BufWritePost",
    },
    ignore_path_regexs = {
        "/.git/",
    },
}

return opts

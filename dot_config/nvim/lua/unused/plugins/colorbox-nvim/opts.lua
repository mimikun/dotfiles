---@type string
local cache_dir = table.concat({ vim.fn.stdpath("data"), "colorbox.nvim" }, require("config.global").path_sep)

---@type colorbox.Options
local opts = {
    --- @type table<string, function>
    setup = {},

    --- @type string
    cache_dir = cache_dir,
}

return opts

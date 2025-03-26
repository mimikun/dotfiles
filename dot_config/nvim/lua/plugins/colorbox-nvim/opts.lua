---@type string
local cache_dir = table.concat({ vim.fn.stdpath("data"), "colorbox.nvim" }, require("config.global").path_sep)

---@type colorbox.Options
local opts = {
    --- @type colorbox.PolicyConfig
    policy = "shuffle",
    --- @type "startup"|"interval"|"filetype"
    timing = "startup",
    filter = "primary",
    --- @type table<string, function>
    setup = {},
    --- @type "dark"|"light"|nil
    background = nil,
    --- @type colorbox.Options
    command = {
        name = "Colorbox",
        desc = "Colorschemes player controller",
    },
    --- @type string
    cache_dir = cache_dir,
}

return opts

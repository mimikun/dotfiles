---@class snacks.Config
local opts = {
    bigfile = { enabled = true },
    dashboard = require("plugins.configs.snacks-nvim.dashboard"),
    -- TODO: want use it
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    styles = {
        notification = {
            wo = { wrap = true },
        },
    },
    words = { enabled = true },
}

return opts

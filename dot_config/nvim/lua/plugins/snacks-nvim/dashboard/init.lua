---@class snacks.dashboard.Config
local config = {
    enabled = true,
    preset = {
        keys = require("plugins.snacks-nvim.dashboard.keys"),
        header = require("plugins.snacks-nvim.dashboard.header"),
    },
    sections = {
        {
            section = "header",
        },
        {
            pane = 2,
            section = "keys",
            gap = 1,
            padding = 1,
        },
        {
            section = "startup",
        },
    },
}

return config

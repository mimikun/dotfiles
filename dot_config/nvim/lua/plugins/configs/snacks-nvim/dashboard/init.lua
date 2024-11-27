---@class snacks.dashboard.Config
local config = {
    -- NOTE: conflict alpha.nvim
    enabled = true,
    preset = {
        keys = require("plugins.configs.snacks-nvim.dashboard.keys"),
        header = require("plugins.configs.snacks-nvim.dashboard.header"),
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

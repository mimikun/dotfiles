---@class snacks.dashboard.Config
local config = {
    enabled = true,
    preset = {
        keys = require("plugins.snacks-nvim.dashboard.keys"),
        header = require("plugins.snacks-nvim.dashboard.header").get("covid_19").Japan,
    },
    sections = require("plugins.snacks-nvim.dashboard.sections"),
}

return config

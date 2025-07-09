---@type LazySpec
local spec = {
    "athar-qadri/weather.nvim",
    --name = ""
    --lazy = false,
    cmd = "WeatherNow",
    dependencies = require("plugins.weather-nvim.dependencies"),
    config = function()
        require("weather"):setup(require("plugins.weather-nvim.opts"))
        require("weather.notify").start()
    end,
    cond = false,
    enabled = false,
    --main = ""
}

return spec

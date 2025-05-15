---@type WeatherWeatherConfig
local opts = {
    settings = {
        update_interval = 60 * 10 * 1000, -- 10 minutes
        minimum_magnitude = 5,
        location = {
            lat = 35.1472,
            lon = 136.7611,
        },
    },
    default = {
        minimum_magnitude = 4.0, -- Minimum earthquake magnitude for alerts
        minimum_radius = 20, -- Minimum radius in km for earthquake alerts
        default_sources = { "meteo", "usgs" }, -- Data sources
    },
}

return opts

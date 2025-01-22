---@class feed._config
local opts = {
    db_dir = vim.fn.stdpath("data") .. "/feed",
    colorscheme = "",
    date_format = "%Y-%m-%d",
    curl_params = {},
    search = {
        backend = { "telescope" },
    },
    progress = {
        backend = { "fidget" },
    },
    data = {
        backend = "local",
    },
    ---@type feed.feed[]
    feeds = require("plugins.feed-nvim.feeds"),
    integrations = {
        telescope = {},
    },
    icons = {
        enabled = false,
        pod = "📻",
        unread = "👀",
        read = "✅",
        star = "🌟",
        news = "📰",
        tech = "🦾",
        app = "📱",
        blog = "📝",
        email = "📧",
    },
}

return opts

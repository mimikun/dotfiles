---@class feed._config
local opts = {
    db_dir = table.concat({ vim.fn.stdpath("data"), "feed" }, require("config.global").path_sep),
    ---@type table[]
    ui = {
        order = {
            "date",
            "feed",
            "tags",
            "title",
        },
        date = {
            width = "#",
        },
        feed = {
            width = 25,
        },
        tags = {
            width = 20,
        },
        title = {
            width = "#",
        },
        progress = {
            color = "FeedDate",
        },
        query = {
            color = "FeedLabel",
        },
        last_updated = {
            color = "FeedDate",
        },
    },

    winbar = {
        order = {
            "date",
            "feed",
            "tags",
            "title",
            "%=%<",
            "query",
            "last_updated",
        },
    },

    picker = {
        order = {
            "feed",
            "tags",
            "title",
        },
        feed = {
            width = 15,
            color = "FeedTitle",
        },
        tags = {
            width = 15,
            color = "FeedTags",
        },
        title = {
            color = "FeedTitle",
        },
    },

    search = {
        default_query = "@2-weeks-ago +unread ",
        sort_order = "descending",
        backend = { "telescope" },
    },

    progress = {
        backend = { "fidget" },
    },

    protocol = {
        backend = "local",
    },

    ---@type feed.feed[]
    feeds = require("plugins.feed-nvim.feeds"),

    zen = {
        enabled = true,
        width = 90,
    },
}

return opts

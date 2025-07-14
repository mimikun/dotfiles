---@type table
local opts = {
    open_cmd = "wsl-open",
    feeds = require("plugins.rssfeed-nvim.feeds"),
}

---@type LazySpec
local spec = {
    "4DRIAN0RTIZ/rssfeed.nvim",
    --lazy = false,
    cmd = "RSSFeed",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec

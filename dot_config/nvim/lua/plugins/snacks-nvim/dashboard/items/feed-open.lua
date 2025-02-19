---@type snacks.dashboard.Item
local feed_open = {
    icon = "󰑫",
    key = "f",
    desc = "Feed",
    action = function()
        vim.cmd(":Feed")
    end,
}

return feed_open

---@type snacks.dashboard.Item
local lazy_update = {
    icon = "",
    key = "l",
    desc = "Update Plugins",
    action = function()
        require("lazy").sync()
    end,
}

return lazy_update

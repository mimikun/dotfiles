---@type snacks.dashboard.Item
local lazy_home = {
    icon = "󰒲",
    key = "L",
    desc = "Lazy",
    action = function()
        require("lazy").home()
    end,
    enabled = package.loaded.lazy ~= nil,
}

return lazy_home

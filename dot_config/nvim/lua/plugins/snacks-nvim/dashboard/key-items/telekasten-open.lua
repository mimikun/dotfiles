---@type snacks.dashboard.Item
local telekasten_open = {
    icon = "󰃶",
    key = "t",
    desc = "Open DailyNote",
    action = function()
        require("telekasten").goto_today()
    end,
}

return telekasten_open

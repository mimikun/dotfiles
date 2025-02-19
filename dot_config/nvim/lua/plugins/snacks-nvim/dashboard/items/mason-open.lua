---@type snacks.dashboard.Item
local mason_open = {
    icon = "󰭠",
    key = "M",
    desc = "Mason",
    action = function()
        require("mason.ui").open()
    end,
}

return mason_open

---@type snacks.dashboard.Item[]
local hydra_dashboard_menu = {
    icon = "󰕮",
    key = "d",
    desc = "Dashboard",
    action = function()
        require("plugins.hydra-nvim.dashboard-menu"):activate()
    end,
}

return hydra_dashboard_menu

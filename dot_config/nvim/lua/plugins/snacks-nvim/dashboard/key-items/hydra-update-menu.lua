---@type snacks.dashboard.Item[]
local hydra_update_menu = {
    icon = "",
    key = "u",
    desc = "Update",
    action = function()
        require("plugins.hydra-nvim.update-menu"):activate()
    end,
}

return hydra_update_menu

---@type snacks.dashboard.Item[]
local hydra_other_menu = {
    icon = "",
    key = "o",
    desc = "Other",
    action = function()
        require("plugins.hydra-nvim.other-menu"):activate()
    end,
}

return hydra_other_menu

---@type snacks.dashboard.Item[]
local hydra_generate_menu = {
    icon = "󱁻",
    key = "g",
    desc = "Generate",
    action = function()
        require("plugins.hydra-nvim.generate-menu"):activate()
    end,
}

return hydra_generate_menu

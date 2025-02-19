---@type snacks.dashboard.Item
local generate_dotfyle = {
    icon = "",
    key = "d",
    desc = "DotfyleMetaData",
    action = function()
        require("dotfyle_metadata").generate({ "--keymaps" })
    end,
}

return generate_dotfyle

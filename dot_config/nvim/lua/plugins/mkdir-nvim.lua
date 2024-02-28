---@type table
local keys = {
    { "w", mode = "c", desc = "You can mkdir -p" },
}

return {
    "jghauser/mkdir.nvim",
    --lazy = false,
    --event = "VeryLazy",
    keys = keys,
    --cond = false,
}

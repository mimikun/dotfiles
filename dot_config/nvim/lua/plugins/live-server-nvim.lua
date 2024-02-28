---@type table
local cmds = {
    "LiveServerStart",
    "LiveServerStop",
}

return {
    "barrett-ruth/live-server.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    config = true,
    --cond = false,
}

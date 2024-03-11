---@type table
local cmds = {
    "LiveServerStart",
    "LiveServerStop",
}

---@type LazySpec
local spec = {
    "barrett-ruth/live-server.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    config = true,
    --cond = false,
}

return spec

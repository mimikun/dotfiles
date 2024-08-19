---@type table
local cmds = {
    "OverseerOpen",
    "OverseerClose",
    "OverseerToggle",
    "OverseerSaveBundle",
    "OverseerLoadBundle",
    "OverseerDeleteBundle",
    "OverseerRunCmd",
    "OverseerRun",
    "OverseerInfo",
    "OverseerBuild",
    "OverseerQuickAction",
    "OverseerTaskAction",
    "OverseerClearCache",
}

---@type LazySpec
local spec = {
    "stevearc/overseer.nvim",
    --lazy = false,
    cmd = cmds,
    opts = {},
    --cond = false,
}

return spec

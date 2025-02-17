---@type table
local cmds = {
    "PlayerOneEnable",
    "PlayerOneDisable",
    "PlayerOneToggle",
    "PlayerOneLoad",
}

---@class PlayerOne.Config
local opts = {
    is_enabled = false,
    theme = "synth",
}

---@type LazySpec
local spec = {
    "jackplus-xyz/player-one.nvim",
    --lazy = false,
    cmd = cmds,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec

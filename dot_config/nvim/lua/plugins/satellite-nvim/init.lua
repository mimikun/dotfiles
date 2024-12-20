---@type table
local cmds = {
    "SatelliteEnable",
    "SatelliteDisable",
    "SatelliteRefresh",
}

---@type LazySpec[]
local dependencies = {
    "lewis6991/gitsigns.nvim",
}

---@type LazySpec
local spec = {
    "lewis6991/satellite.nvim",
    --lazy = false,
    cmd = cmds,
    event = "VimEnter",
    dependencies = dependencies,
    opts = require("plugins.satellite-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec

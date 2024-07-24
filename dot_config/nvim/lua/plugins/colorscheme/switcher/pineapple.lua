---@type table
local cmds = {
    "Pineapple",
    "Pineapple2",
}

---@type LazySpec
local spec = {
    "CWood-sdf/pineapple",
    --lazy = false,
    cmd = cmds,
    dependencies = require("plugins.sources.pineapple"),
    opts = {
        installedRegistry = "plugins.sources.pineapple",
        colorschemeFile = "lua/core/pineapple.lua",
    },
    --cond = false,
}

return spec

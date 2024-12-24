---@type table
local cmds = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
}

---@type table
local opts = {
    exclude = {},
}

---@type LazySpec
local spec = {
    "folke/twilight.nvim",
    --lazy = false,
    cmd = cmds,
    config = function()
        local twilight = require("twilight")
        twilight.setup(opts)
        twilight.disable()
    end,
    --cond = false,
    --enabled = false,
}

return spec

---@type table
local cmds = {
    "IBLEnable",
    "IBLDisable",
    "IBLToggle",
    "IBLEnableScope",
    "IBLDisableScope",
    "IBLToggleScope",
}

---@type LazySpec
local spec = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    opts = require("plugins.indent-blankline.opts"),
    --cond = false,
    --enabled = false,
}

return spec

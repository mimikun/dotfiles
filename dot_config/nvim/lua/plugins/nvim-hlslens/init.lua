---@type table
local cmds = {
    "HlSearchLensToggle",
    "HlSearchLensEnable",
    "HlSearchLensDisable",
}

---@type LazySpec
local spec = {
    "kevinhwang91/nvim-hlslens",
    lazy = false,
    keys = require("plugins.nvim-hlslens.keys"),
    cmd = cmds,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec

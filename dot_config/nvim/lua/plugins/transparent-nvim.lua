---@type table
local cmds = {
    "TransparentEnable",
    "TransparentDisable",
    "TransparentToggle",
}

---@type LazySpec
local spec = {
    "xiyaowong/transparent.nvim",
    lazy = false,
    cmd = cmds,
    opts = {},
    --cond = false,
}

return spec

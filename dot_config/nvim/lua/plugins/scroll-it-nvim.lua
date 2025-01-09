---@type table
local cmds = {
    "ScrollItEnable",
    "ScrollItDisable",
    "ScrollItToggle",
}

---@type LazySpec
local spec = {
    "jackplus-xyz/scroll-it.nvim",
    --lazy = false,
    cmd = cmds,
    opts = {
        enabled = false,
    },
    --cond = false,
    --enabled = false,
}

return spec

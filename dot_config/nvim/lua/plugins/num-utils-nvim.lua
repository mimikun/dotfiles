---@type table
local cmds = {
    "NumToHex",
    "NumToBinary",
    "NumToOctal",
    "NumToDecimal",
}

---@type LazySpec
local spec = {
    "mintsuku/num-utils.nvim",
    --lazy = false,
    cmd = cmds,
    opts = {},
    --cond = false,
}

return spec

---@type table
local cmds = {
    "HopWord",
    "HopChar1",
    "HopChar2",
    "HopPattern",
    "HopLine",
    "HopLineStart",
    "HopAnywhere",
    "HopNodes",
    "HopYankChar1",
}

local opts = {
    keys = "asdghklqwertyuiopzxcvbnmfj",
    quit_key = "<Esc>",
}

---@type LazySpec
local spec = {
    "smoka7/hop.nvim",
    version = "*",
    --lazy = false,
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec

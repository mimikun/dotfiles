---@type table
local cmds = {
    "SudoWrite",
    "SudoRead",
}

---@type LazySpec
local spec = {
    "denialofsandwich/sudo.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    cond = false,
    enabled = false,
}

return spec

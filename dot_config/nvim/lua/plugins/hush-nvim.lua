---@type LazyKeysSpec[]
local keys = {
    { "<leader>h", "<Cmd>Hush<CR>", desc = "Hush" },
}

---@type table
local cmds = {
    "Hush",
    "HushAll",
}

---@type LazySpec
local spec = {
    "mbienkowsk/hush.nvim",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    opts = {},
    cond = false,
    enabled = false,
}

return spec

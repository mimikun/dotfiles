---@type table
local keys = {
    { "<leader>bt", desc = "Reopen buffer" },
    { "<C-S-t>", desc = "Reopen buffer" },
}

---@type LazySpec
local spec = {
    "iamyoki/buffer-reopen.nvim",
    --lazy = false,
    keys = keys,
    cmds = "BufferHistory",
    opts = {},
    --cond = false,
}

return spec

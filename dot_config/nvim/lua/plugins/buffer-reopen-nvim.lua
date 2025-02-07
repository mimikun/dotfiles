---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>bt",
        mode = "n",
        desc = "Reopen buffer",
    },
    {
        "<C-S-t>",
        mode = "n",
        desc = "Reopen buffer",
    },
}

---@type LazySpec
local spec = {
    "iamyoki/buffer-reopen.nvim",
    --lazy = false,
    cmd = "BufferHistory",
    keys = keys,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec

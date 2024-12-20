---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>h",
        ":HopWord<CR>",
        mode = "n",
        { silent = true },
        desc = "HopWord",
    },
}

---@type table
local opts = {
    keys = "asdghklqwertyuiopzxcvbnmfj",
    quit_key = "<Esc>",
}

---@type LazySpec
local spec = {
    "smoka7/hop.nvim",
    version = "*",
    --lazy = false,
    keys = keys,
    cmd = require("plugins.hop-nvim.cmds"),
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec

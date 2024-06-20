---@type table
local keys = {
    { "<leader>h", desc = "HopWord" },
}

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
    keys = keys,
    cmd = cmds,
    config = function(_, opts)
        local hop = require("hop")
        hop.setup(opts)
        vim.keymap.set("n", "<leader>h", ":HopWord<CR>", { silent = true })
    end,
    --cond = false,
}

return spec

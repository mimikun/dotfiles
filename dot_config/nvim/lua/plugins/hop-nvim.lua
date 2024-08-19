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
    opts = opts,
    --cond = false,
    -- NOTE: easymotion plugin
    --enabled = false,
}

return spec

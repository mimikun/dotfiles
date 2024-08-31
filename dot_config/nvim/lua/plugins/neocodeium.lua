---@type boolean
local cond = require("config.settings").use_ai

---@type table
local opts = {
    enabled = false,
    ---@type table<string, boolean> Set to `false` to disable suggestions in buffers with specific filetypes
    filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
    },
}

---@type LazySpec
local spec = {
    "monkoose/neocodeium",
    --lazy = false,
    cmd = "NeoCodeium",
    keys = require("plugins.configs.neocodeium.keys"),
    event = "VeryLazy",
    opts = opts,
    cond = cond,
    enabled = cond,
}

return spec

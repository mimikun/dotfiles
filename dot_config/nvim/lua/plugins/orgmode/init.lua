---@type LazySpec
local spec = {
    "nvim-orgmode/orgmode",
    --lazy = false,
    ft = { "org" },
    cmd = "Org",
    event = "VeryLazy",
    opts = require("plugins.orgmode.opts"),
    --cond = false,
    --enabled = false,
}

return spec

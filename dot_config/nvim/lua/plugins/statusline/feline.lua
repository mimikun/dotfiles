---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type LazySpec
local spec = {
    "freddiehaddad/feline.nvim",
    --lazy = false,
    event = events,
    --opts = {},
    config = function()
        local feline = require("feline")
        feline.setup()
        feline.winbar.setup()
        feline.statuscolumn.setup()
    end,
    cond = false,
}

return spec

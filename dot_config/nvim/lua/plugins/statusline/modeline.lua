---@type table
local events = { "BufReadPre", "BufNewFile" }

---@type LazySpec
local spec = {
    "nvimdev/modeline.nvim",
    --lazy = false,
    event = events,
    opts = {},
    cond = false,
}

return spec

---@type table
local opts = {
    excluded = {
        cmd = { "substitute" },
    },
}

---@type LazySpec
local spec = {
    "winston0410/range-highlight.nvim",
    --lazy = false,
    event = "CmdlineEnter",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec

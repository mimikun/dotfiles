---@type table
local opts = {
    ui = {
        -- the format of the last commit date
        date_format = "%Y-%m-%d",
    },
    -- the list of plugins to be ignored
    ignored = {
        "orphans.nvim",
    },
}

---@type LazySpec
local spec = {
    "ZWindL/orphans.nvim",
    --lazy = false,
    cmd = "Orphans",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec

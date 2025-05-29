---@type table
local opts = {
    thresholds = {
        low = 10, -- CCN <= low is considered low complexity
        medium = 15, -- CCN > low and <= medium is medium complexity
        -- CCN > medium is high complexity
    },
    virt_pos = "eol", -- extmark position ("eol" or "overlay")
}

---@type LazySpec
local spec = {
    "4DRIAN0RTIZ/complexity.nvim",
    build = "pip install lizard",
    --lazy = false,
    cmd = "ShowComplexity",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec

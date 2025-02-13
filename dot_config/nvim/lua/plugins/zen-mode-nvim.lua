---@class ZenOptions
local opts = {
    plugins = {
        wezterm = {
            enabled = false,
            -- can be either an absolute font size or the number of incremental steps
            -- (10% increase per step)
            font = "+4",
        },
    },
}

---@type LazySpec
local spec = {
    "folke/zen-mode.nvim",
    --lazy = false,
    cmd = "ZenMode",
    dependencies = { "folke/twilight.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec

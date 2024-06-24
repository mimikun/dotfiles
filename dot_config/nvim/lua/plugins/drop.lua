---@type table
local opts = {
    -- can be one of the default themes, or a custom theme
    theme = "leaves",
    -- maximum number of drops on the screen
    max = 40,
    -- every 150ms we update the drops
    interval = 150,
    -- show after 5 minutes. Set to false, to disable
    screensaver = 1000 * 60 * 5,
    -- will enable/disable automatically for the following filetypes
    filetypes = { "dashboard", "alpha", "starter" },
}

---@type LazySpec
local spec = {
    "folke/drop.nvim",
    --lazy = false,
    event = "VimEnter",
    opts = opts,
    cond = false,
}

return spec

---@type table
local opts = {
    disabled_filetypes = { "help", "text", "markdown" },
}

---@type LazySpec
local spec = {
    "m4xshen/smartcolumn.nvim",
    --lazy = false,
    event = "BufEnter",
    opts = opts,
    --cond = false,
    -- NOTE: colorcolumn plugin
    enabled = false,
}

return spec

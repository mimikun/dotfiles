---@type table
local opts = {
    enabled = true,
    transparency_color = vim.g.transparent_enabled,
}

---@type LazySpec
local spec = {
    "rachartier/tiny-glimmer.nvim",
    --lazy = false,
    cmd = "TinyGlimmer",
    event = "TextYankPost",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec

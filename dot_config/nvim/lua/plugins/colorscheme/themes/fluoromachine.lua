---@type table
local opts = {
    glow = false,
    brightness = 0.05,
    theme = "fluoromachine",
    --theme = "retrowave",
    --theme = "delta",
    transparent = vim.g.transparent_enabled,
}

---@type LazySpec
local spec = {
    "maxmx03/fluoromachine.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec

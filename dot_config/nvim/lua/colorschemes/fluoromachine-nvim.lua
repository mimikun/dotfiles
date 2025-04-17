---@type LazySpec
local spec = {
    "maxmx03/fluoromachine.nvim",
    --lazy = false,
    opts = {
        theme = "fluoromachine",
        --theme = "retrowave",
        --theme = "delta",
        brightness = 0.05,
        glow = false,
        transparent = vim.g.transparent_enabled,
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec

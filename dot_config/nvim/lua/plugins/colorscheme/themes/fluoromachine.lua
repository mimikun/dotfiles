---@type LazySpec
local spec = {
    "maxmx03/fluoromachine.nvim",
    --lazy = false,
    opts = {
        glow = false,
        brightness = 0.05,
        theme = "fluoromachine",
        --theme = "retrowave",
        --theme = "delta",
        transparent = vim.g.transparent_enabled,
    },
    --cond = false,
}

return spec

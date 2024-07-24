---@type LazySpec
local spec = {
    "0xstepit/flow.nvim",
    lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        fluo_color = "pink",
        --fluo_color = "yellow",
        --fluo_color = "orange",
        --fluo_color = "green",
        mode = "normal",
        --mode = "bright",
        --mode = "desaturate",
        --mode = "dark",
        aggressive_spell = false,
    },
    --cond = false,
    priority = 1000,
}

return spec

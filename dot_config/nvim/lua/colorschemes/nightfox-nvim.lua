---@type LazySpec
local spec = {
    "EdenEast/nightfox.nvim",
    --lazy = false,
    opts = {
        options = {
            transparent = vim.g.transparent_enabled,
            -- Non focused panes set to alternative background
            dim_inactive = false,
            -- Default enable value for modules
            module_default = true,
            colorblind = {
                -- Enable colorblind support
                enable = false,
                -- Only show simulated colorblind colors and not diff shifted
                simulate_only = false,
            },
        },
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec

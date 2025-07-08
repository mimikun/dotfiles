---@type LazySpec
local spec = {
    "slugbyte/lackluster.nvim",
    --lazy = false,
    opts = {
        -- NOTE: Not support "transparent = true"
        tweak_ui = {
            disable_undercurl = false,
            enable_end_of_buffer = false,
        },
        tweak_background = {
            -- 'default' is default
            -- 'none' is transparent
            -- main background
            normal = "none",
            -- nvim_cmp, wildmenu ...
            menu = "none",
            -- lazy, mason, whichkey ...
            popup = "none",
            -- telescope
            telescope = "none",
        },
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec

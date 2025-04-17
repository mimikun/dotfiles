---@type LazySpec
local spec = {
    "b0o/lavi.nvim",
    --lazy = false,
    dependencies = {
        "rktjmp/lush.nvim",
    },
    opts = {
        -- NOTE: Not support "transparent = true"
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec

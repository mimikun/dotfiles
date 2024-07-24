---@type LazySpec
local spec = {
    "Isrothy/neominimap.nvim",
    -- WARN: NO NEED to Lazy load
    lazy = false,
    cmd = "Neominimap",
    init = function()
        -- Recommended
        vim.opt.wrap = false
        -- It's recommended to set a large value
        vim.opt.sidescrolloff = 36
        ---@module "neominimap.config.meta"

        ---@type Neominimap.UserConfig
        vim.g.neominimap = {
            auto_enable = false,
        }
    end,
    --cond = false,
}

return spec

---@module "quicker"
---@type quicker.SetupOptions
local opts = {
    -- Local options to set for quickfix
    opts = {
        buflisted = false,
        number = false,
        relativenumber = false,
        signcolumn = "auto",
        winfixheight = true,
        wrap = false,
    },
    -- Set to false to disable the default options in `opts`
    use_default_opts = true,
    -- Keymaps to set for the quickfix buffer
    keys = {
        {
            ">",
            function()
                require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
            end,
            desc = "Expand quickfix context",
        },
        {
            "<",
            function()
                require("quicker").collapse()
            end,
            desc = "Collapse quickfix context",
        },
    },
    follow = {
        -- When quickfix window is open, scroll to closest item to the cursor
        enabled = false,
    },
}

return opts

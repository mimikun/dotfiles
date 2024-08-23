---@type table
local lazy_subcmds = {
    {
        -- Lazy home
        cmd = "Lazy home",
        order = 1,
        action = {
            type = "callback",
            callback = function(_)
                vim.cmd([[Lazy home]])
            end,
        },
    },
    {
        -- Lazy update
        cmd = "Lazy update",
        order = 2,
        action = {
            type = "callback",
            callback = function(_)
                vim.cmd([[Lazy update]])
            end,
        },
    },
}

---@type table
local opts = {
    menu_items = {
        -- Lazy
        {
            cmd = "Lazy",
            order = 1,
            action = {
                type = "sub_cmds",
                sub_cmds = lazy_subcmds,
            },
        },
    },
}

return opts

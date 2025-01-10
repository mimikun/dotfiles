---@type table
local opts = {
    ignored_buftypes = {
        "nofile",
        "quickfix",
        "prompt",
    },
    ignored_filetypes = {
        "NvimTree",
    },
    ignored_events = {
        "BufEnter",
        "WinEnter",
    },
    default_amount = 1,
    resize_mode = {
        silent = true,
        hooks = {
            on_enter = function()
                vim.notify("Entering resize mode")
            end,
            on_leave = function()
                vim.notify("Exiting resize mode, bye")
            end,
        },
    },
}

return opts

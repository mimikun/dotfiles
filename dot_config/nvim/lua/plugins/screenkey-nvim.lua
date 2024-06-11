---@type table
local opts = {
    -- see :h nvim_open_win
    win_opts = {
        relative = "editor",
        anchor = "SE",
        width = 40,
        height = 3,
        border = "single",
    },
    -- compress input when repeated <compress_after> times
    compress_after = 3,
    -- clear the input after <clear_after> seconds of inactivity
    clear_after = 3,
    -- temporarily disable screenkey (for example when inside of the terminal)
    disable = {
        -- for example: "toggleterm"
        filetypes = { "toggleterm" },
        -- :h 'buftype'
        -- for example: "terminal"
        buftypes = { "terminal" },
    },
}

---@type LazySpec
local spec = {
    "NStefan002/screenkey.nvim",
    --lazy = false,
    cmd = "Screenkey",
    opts = opts,
    --cond = false,
}

return spec

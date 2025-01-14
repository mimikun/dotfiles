---@type table
local opts = {
    select_prompt = " legendary.nvim ",
    col_separator_char = "│",
    icons = {
        command = "",
        fn = "󰡱",
        itemgroup = "",
    },
    sort = {
        frecency = {
            db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
            max_timestamps = 10,
        },
    },
    extensions = {
        lazy_nvim = true,
        which_key = { auto_register = false },
        nvim_tree = true,
        smart_splits = {
            directions = { "h", "j", "k", "l" },
            prev_win = "<C-\\>",
            mods = {
                move = "<C>",
                resize = "<M>",
                swap = "<S>",
            },
        },
        op_nvim = false,
        diffview = true,
    },
    -- Directory used for caches
    cache_path = string.format("%s/legendary/", vim.fn.stdpath("cache")),
}

return opts

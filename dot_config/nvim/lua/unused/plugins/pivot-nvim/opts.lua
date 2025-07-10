---@type table
local opts = {
    -- Core behavior settings
    smart_splits = true, -- Allow split keymaps to merge into adjacent windows instead of splitting
    smart_close = true, -- Close buffers while preserving window layout
    prevent_duplicates = true, -- Avoid showing the same buffer in multiple windows

    -- Keymap configuration (set any to false to disable)
    keymaps = {
        -- Split: Uses standard Vim geometry. Merges if smart_splits = true and neighbor exists.
        -- If multiple merge targets exist, shows a visual prompt.
        split_right = "<leader>sl", -- (:vnew or merge)
        split_left = "<leader>sh", -- (:vnew or merge)
        split_down = "<leader>sj", -- (:new or merge)
        split_up = "<leader>sk", -- (:new or merge)

        -- Split management
        close_split = "<leader>sd",
        close_other_splits = "<leader>so",
        close_all_splits = "<leader>sa",

        -- Terminal
        terminal = "<leader>tt", -- Open terminal in current window

        -- Buffer operations
        close_buffer = "<leader>bd",
        close_other_buffers = "<leader>bo",
        close_all_buffers = "<leader>ba",

        -- Move buffer to different split (Example: Not enabled by default)
        move_to_right = "<leader>bl",
        move_to_left = "<leader>bh",
        move_to_down = "<leader>bj",
        move_to_up = "<leader>bk",

        -- Buffer navigation (skips buffers visible in other windows)
        prev_buffer = "<C-h>",
        next_buffer = "<C-l>",
        alt_prev_buffer = "<C-k>",
        alt_next_buffer = "<C-j>",

        -- Split navigation
        nav_left = "<C-D-h>",
        nav_right = "<C-D-l>",
        nav_down = "<C-D-j>",
        nav_up = "<C-D-k>",

        -- Terminal navigation
        exit_terminal_mode = "<Esc>",
    },

    -- Command options
    commands = {
        enable = true,
        prefix = "Pivot",
    },
}

return opts

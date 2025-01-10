---@type LazyKeysSpec[]
local keys = {
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    {
        "<A-h>",
        require("smart-splits").resize_left,
        mode = "n",
    },
    {
        "<A-j>",
        require("smart-splits").resize_down,
        mode = "n",
    },
    {
        "<A-k>",
        require("smart-splits").resize_up,
        mode = "n",
    },
    {
        "<A-l>",
        require("smart-splits").resize_right,
        mode = "n",
    },
    -- moving between splits
    {
        "<C-h>",
        require("smart-splits").move_cursor_left,
        mode = "n",
    },
    {
        "<C-j>",
        require("smart-splits").move_cursor_down,
        mode = "n",
    },
    {
        "<C-k>",
        require("smart-splits").move_cursor_up,
        mode = "n",
    },
    {
        "<C-l>",
        require("smart-splits").move_cursor_right,
        mode = "n",
    },
    {
        "<C-\\>",
        require("smart-splits").move_cursor_previous,
        mode = "n",
    },
    -- swapping buffers between windows
    {
        "<leader><leader>h",
        require("smart-splits").swap_buf_left,
        mode = "n",
    },
    {
        "<leader><leader>j",
        require("smart-splits").swap_buf_down,
        mode = "n",
    },
    {
        "<leader><leader>k",
        require("smart-splits").swap_buf_up,
        mode = "n",
    },
    {
        "<leader><leader>l",
        require("smart-splits").swap_buf_right,
        mode = "n",
    },
}

return keys

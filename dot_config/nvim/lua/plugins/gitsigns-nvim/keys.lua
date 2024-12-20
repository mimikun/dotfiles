---@type LazyKeysSpec[]
local keys = {
    -- Navigation
    {
        "]c",
        mode = "n",
        desc = "gitsigns.nav_hunk('next')",
    },
    {
        "[c",
        mode = "n",
        desc = "gitsigns.nav_hunk('prev')",
    },

    -- Actions
    {
        "<leader>hs",
        mode = "n",
        desc = "gitsigns.stage_hunk",
    },
    {
        "<leader>hr",
        mode = "n",
        desc = "gitsigns.reset_hunk",
    },
    {
        "<leader>hs",
        mode = "v",
        desc = "gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })",
    },
    {
        "<leader>hr",
        mode = "v",
        desc = "gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })",
    },
    {
        "<leader>hS",
        mode = "n",
        desc = "gitsigns.stage_buffer",
    },
    {
        "<leader>hu",
        mode = "n",
        desc = "gitsigns.undo_stage_hunk",
    },
    {
        "<leader>hR",
        mode = "n",
        desc = "gitsigns.reset_buffer",
    },
    {
        "<leader>hp",
        mode = "n",
        desc = "gitsigns.preview_hunk",
    },
    {
        "<leader>hb",
        mode = "n",
        desc = "gitsigns.blame_line({ full = true })",
    },
    {
        "<leader>tb",
        mode = "n",
        desc = "gitsigns.toggle_current_line_blame",
    },
    {
        "<leader>hd",
        mode = "n",
        desc = "gitsigns.diffthis",
    },
    {
        "<leader>hD",
        mode = "n",
        desc = "gitsigns.diffthis('~')",
    },
    {
        "<leader>td",
        mode = "n",
        desc = "gitsigns.toggle_deleted",
    },

    -- Text object
    {
        "ih",
        mode = { "o", "x" },
        desc = ":<C-U>Gitsigns select_hunk<CR>",
    },
}

return keys

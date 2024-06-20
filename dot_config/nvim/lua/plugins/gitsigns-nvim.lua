---@type table
local keys = {
    { "g[", desc = "Jump to the previous hunk in the current buffer." },
    { "g]", desc = "Jump to the next hunk in the current buffer." },
    { "gh", desc = "Toggle diff highlights" },
    { "gp", desc = "Preview the hunk at the cursor position inline in the buffer." },
}

---@type table
local opts = {
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    -- Toggle with `:Gitsigns toggle_signs`
    signcolumn = true,
    -- Toggle with `:Gitsigns toggle_numhl`
    numhl = false,
    -- Toggle with `:Gitsigns toggle_linehl`
    linehl = false,
    -- Toggle with `:Gitsigns toggle_word_diff`
    word_diff = false,
    watch_gitdir = {
        follow_files = true,
    },
    attach_to_untracked = true,
    -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        -- 'eol' | 'overlay' | 'right_align'
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    -- Use default
    status_formatter = nil,
    -- Disable if file is longer than this (in lines)
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
}

---@type LazySpec
local spec = {
    "lewis6991/gitsigns.nvim",
    --lazy = false,
    keys = keys,
    event = { "VimEnter" },
    config = function()
        require("gitsigns").setup(opts)

        -- g]で前の変更箇所へ移動する
        vim.keymap.set("n", "g[", ":Gitsigns prev_hunk<CR>")
        -- g[で次の変更箇所へ移動する,
        vim.keymap.set("n", "g]", ":Gitsigns next_hunk<CR>")
        -- ghでdiffをハイライトする
        vim.keymap.set("n", "gh", ":Gitsigns toggle_linehl<CR>")
        -- gpでカーソル行のdiffを表示する
        vim.keymap.set("n", "gp", ":Gitsigns preview_hunk_inline<CR>")
    end,
    --cond = false,
}

return spec

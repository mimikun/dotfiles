local keymaps = {
    { "g[", desc = "Jump to the previous [count] hunk." },
    { "g]", desc = "Jump to the next [count] hunk." },
    { "gh", desc = "Turn line highlighting on or off." },
    { "gp", desc = "Preview the hunk the cursor is in." },
}

return {
    "airblade/vim-gitgutter",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    config = function()
        -- g]で前の変更箇所へ移動する
        vim.keymap.set("n", "g[", ":GitGutterPrevHunk<CR>")

        -- g[で次の変更箇所へ移動する
        vim.keymap.set("n", "g]", ":GitGutterNextHunk<CR>")

        -- ghでdiffをハイライトする
        vim.keymap.set("n", "gh", ":GitGutterLineHighlightsToggle<CR>")

        -- gpでカーソル行のdiffを表示する
        vim.keymap.set("n", "gp", ":GitGutterPreviewHunk<CR>")

        -- 記号の色を変更する
        vim.cmd([[highlight GitGutterAdd ctermfg=green]])
        vim.cmd([[highlight GitGutterChange ctermfg=blue]])
        vim.cmd([[highlight GitGutterDelete ctermfg=red]])
    end,
    cond = false,
}

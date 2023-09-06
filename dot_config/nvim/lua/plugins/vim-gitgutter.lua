return {
    "airblade/vim-gitgutter",
    --lazy = false,
    --event = "VeryLazy",
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

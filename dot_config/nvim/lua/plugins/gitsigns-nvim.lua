return {
    "lewis6991/gitsigns.nvim",
    --lazy = false,
    event = "WinEnter",
    cmd = "Gitsigns",
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            signcolumn = false,
            -- g]で前の変更箇所へ移動する
            vim.keymap.set("n", "g[", ":Gitsigns prev_hunk<CR>"),
            -- g[で次の変更箇所へ移動する,
            vim.keymap.set("n", "g]", ":Gitsigns next_hunk<CR>"),
            -- ghでdiffをハイライトする
            vim.keymap.set("n", "gh", ":Gitsigns toggle_linehl<CR>"),
            -- gpでカーソル行のdiffを表示する
            vim.keymap.set("n", "gp", ":Gitsigns preview_hunk_inline<CR>"),

            -- 記号の色を変更する
            --vim.cmd.highlight("GitSignsAdd ctermfg=green"),
            --vim.cmd.highlight("GitSignsChange ctermfg=blue"),
            --vim.cmd.highlight("GitSignsDelete ctermfg=red"),
        })
    end,
    --cond = false,
}

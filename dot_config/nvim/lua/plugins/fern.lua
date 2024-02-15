-- thx: https://github.com/yuucu/dotfiles/blob/d31fbb387fd0e08f168b366de8aa763b5b0ac769/.config/nvim/lua/plugins/fern.lua
-- thx: https://qiita.com/matoruru/items/b5ad6e0f1ef6c804378d
-- thx: https://qiita.com/youichiro/items/b4748b3e96106d25c5bc

local keymaps = {
    { "<C-n>", desc = "Toggle Fern" },
}

return {
    "lambdalisue/fern.vim",
    branch = "main",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "TheLeoP/fern-renderer-web-devicons.nvim",
        "lambdalisue/glyph-palette.vim",
        "lambdalisue/fern-git-status.vim",
    },
    config = function()
        -- アイコン表示を有効にする
        vim.g["fern#renderer"] = "nvim-web-devicons"

        -- アイコンに色をつける
        vim.api.nvim_create_augroup("my_glyph_palette", {})
        vim.api.nvim_create_autocmd("FileType", {
            group = "my_glyph_palette",
            pattern = "fern",
            command = "call glyph_palette#apply()",
        })
        vim.api.nvim_create_autocmd("FileType", {
            group = "my_glyph_palette",
            pattern = { "nerdtree", "startify" },
            command = "call glyph_palette#apply()",
        })

        -- Ctrl+nでファイルツリーを表示/非表示する
        vim.keymap.set("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>")
        -- ドットファイルを表示させる
        vim.g["fern#default_hidden"] = 1
    end,
    --cond = false,
}

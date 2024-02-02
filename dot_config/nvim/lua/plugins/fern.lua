-- ref: https://github.com/yuucu/dotfiles/blob/main/config/nvim/lua/plugins/fern.lua
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
        { "lambdalisue/nerdfont.vim" },
        {
            "lambdalisue/fern-renderer-nerdfont.vim",
            config = function()
                -- アイコン表示を有効にする
                -- ref: https://qiita.com/matoruru/items/b5ad6e0f1ef6c804378d#%E4%BB%98%E3%81%8D%E3%81%AE%E5%A4%89%E6%95%B0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%E3%81%99%E3%82%8B%E9%9A%9B%E3%81%AE%E6%B3%A8%E6%84%8F%E7%82%B9
                vim.g["fern#renderer"] = "nerdfont"
            end,
        },
        {
            "lambdalisue/glyph-palette.vim",
            config = function()
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
            end,
        },
        { "lambdalisue/fern-git-status.vim" },
    },
    config = function()
        -- ref: https://qiita.com/youichiro/items/b4748b3e96106d25c5bc#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%84%E3%83%AA%E3%83%BC%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B
        -- Ctrl+nでファイルツリーを表示/非表示する
        vim.keymap.set("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=40<CR>")
        -- ドットファイルを表示させる
        vim.g["fern#default_hidden"] = 1
    end,
    --cond = false,
}

---@type table
local keymaps = {
    { "<C-n>", desc = "Toggle Fern" },
}

---@type LazySpec
local spec = {
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

return spec

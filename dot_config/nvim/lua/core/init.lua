-- ref: https://zenn.dev/kawarimidoll/articles/19bfc63e1c218c
-- 読み込み高速化?
if vim.loader then
    vim.loader.enable()
end

-- ファイルの種類毎に設定ファイルを記述できるようにする
vim.cmd("filetype plugin indent off")

-- 基本的なオプションを読み込む
require("core.base-options")

-- keymap を読み込む
require("core.keymaps")

-- packer.nvim のファイルを読み込む
require("core.plugins")

vim.cmd("filetype plugin indent on")

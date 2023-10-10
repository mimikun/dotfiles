-- ref: https://zenn.dev/kawarimidoll/articles/19bfc63e1c218c
-- 読み込み高速化?
if vim.loader then
    vim.loader.enable()
end

-- ファイルの種類毎に設定ファイルを記述できるようにする
vim.cmd("filetype plugin indent off")

-- options を読み込む
require("core.options")

-- keymap を読み込む
require("keymaps")

-- plugin を読み込む
require("lazyvim")

-- colorschemeを読み込む
require("core.colorscheme")

vim.cmd("filetype plugin indent on")

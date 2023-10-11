-- ref: https://zenn.dev/kawarimidoll/articles/19bfc63e1c218c
-- 読み込み高速化?
if vim.loader then
    vim.loader.enable()
end

-- ファイルの種類毎に設定ファイルを記述できるようにする
vim.cmd("filetype plugin indent off")

require("core")

vim.cmd("filetype plugin indent on")

-- Set LEADER keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ファイル上の1行が画面上では複数行にわたっているとき
-- NORMALモード時の j/kで見た目通りに移動できるようにする
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- ESCキー連打でハイライト解除
vim.keymap.set("", "<Esc><Esc>", ":nohlsearch<CR><Esc>", { silent = true })

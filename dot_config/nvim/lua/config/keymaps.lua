-- ファイル上の1行が画面上では複数行にわたっているとき
-- NORMALモード時の j/kで見た目通りに移動できるようにする
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- ESCキー連打でハイライト解除
vim.keymap.set("", "<Esc><Esc>", ":nohlsearch<CR><Esc>", { silent = true })

-- GUI VIM用の設定
vim.keymap.set("i", "<S-CR>", "<End><CR>")
vim.keymap.set("i", "<C-S-CR>", "<Up><End><CR>")
vim.keymap.set("n", "<S-CR>", "mzo<ESC>`z")
vim.keymap.set("n", "<C-S-CR>", "mzO<ESC>`z")

-- Ctrl+Wを押した後にnを押すことで新規タブを開けるようにする
vim.keymap.set("n", "<C-w>n", "<Esc>:enew<Return>")

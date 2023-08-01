-- ファイル上の1行が画面上では複数行にわたっているとき
-- NORMALモード時の j/kで見た目通りに移動できるようにする
-- ref:
-- https://zenn.dev/slin/articles/2020-11-03-neovim-lua2#%E3%83%9E%E3%83%83%E3%83%94%E3%83%B3%E3%82%B0
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- ESCキー連打でハイライト解除
vim.keymap.set("", "<Esc><Esc>", ":nohlsearch<CR><Esc>")

-- GUI VIM用の設定
vim.keymap.set("i", "<S-CR>", "<End><CR>")
vim.keymap.set("i", "<C-S-CR>", "<Up><End><CR>")
vim.keymap.set("n", "<S-CR>", "mzo<ESC>`z")
vim.keymap.set("n", "<C-S-CR>", "mzO<ESC>`z")

-- Ctrl+Wを押した後にnを押すことで新規タブを開けるようにする
vim.keymap.set("n", "<C-w>n", "<Esc>:enew<Return>")

-- win32yankの設定
vim.keymap.set("n", "<silent> <Space>y", ":.w !win32yank.exe -i<CR><CR>")
vim.keymap.set("v", "<silent> <Space>y", ":w !win32yank.exe -i<CR><CR>")
vim.keymap.set("n", "<silent> <Space>p", ":r !win32yank.exe -o<CR>")
vim.keymap.set("v", "<silent> <Space>p", ":r !win32yank.exe -o<CR>")

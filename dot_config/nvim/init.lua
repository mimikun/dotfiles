-- ref: https://zenn.dev/kawarimidoll/articles/19bfc63e1c218c
-- 読み込み高速化?
if vim.loader then
    vim.loader.enable()
end

-- ファイルの種類毎に設定ファイルを記述できるようにする
vim.cmd("filetype plugin indent off")

-- 基本的なオプションを読み込む
require("base-options")

-- keymap を読み込む
require("keymaps")

-- packer.nvim のファイルを読み込む
require("plugins")

-- coc.nvim settings
require("coc")

-- nvim-treesitter config
require("treesitter")

-- fern.vim settings
require("fern-vim")

-- vim-gitgutter
require("vim-gitgutter")

-- fzf.vim
require("fzf-vim")

-- vim-markdown
require("vim-markdown")

-- dps-translate-vim
require("dps-translate-vim")

-- ChatGPT.nvim
require("chatgpt-nvim")

-- lualine.nvim settings
require("lualine-nvim")

vim.cmd("filetype plugin indent on")

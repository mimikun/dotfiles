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

-- coc.nvim settings
require("core.coc")

-- nvim-treesitter config
require("core.treesitter")

-- fern.vim settings
require("core.fern-vim")

-- vim-gitgutter
require("core.vim-gitgutter")

-- fzf.vim
require("core.fzf-vim")

-- vim-markdown
require("core.vim-markdown")

-- dps-translate-vim
require("core.dps-translate-vim")

-- ChatGPT.nvim
require("core.chatgpt-nvim")

-- lualine.nvim settings
require("core.lualine-nvim")

vim.cmd("filetype plugin indent on")

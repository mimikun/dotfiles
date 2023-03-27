-- ファイルの種類毎に設定ファイルを記述できるようにする
vim.cmd('filetype plugin indent off')

-- 基本的なオプションを読み込む
require('base-options')

-- keymap を読み込む
require('keymaps')

-- packer.nvim のファイルを読み込む
require('plugins')

-- coc.nvim settings
require('coc')

-- nvim-treesitter config
require('treesitter')

-- vim.airline settings
require('vim-airline')

-- fern.vim settings
require('fern-vim')

-- vim-gitgutter
require('vim-gitgutter')

-- fzf.vim
require('fzf-vim')

-- vim-markdown
require('vim-markdown')

-- dps-translate-vim
require('dps-translate-vim')

-- github-theme
require('github-nvim-theme')

-- monokai.nvim
require('monokai-nvim')

vim.cmd('filetype plugin indent on')

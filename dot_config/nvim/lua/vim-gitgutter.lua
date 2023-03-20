--ref: https://oroques.dev/2020/01/07/neovim-05.html
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- vim-gitgutter
-- g]で前の変更箇所へ移動する
vim.keymap.set('n', 'g[', ':GitGutterPrevHunk<CR>')

-- g[で次の変更箇所へ移動する
vim.keymap.set('n', 'g]', ':GitGutterNextHunk<CR>')

-- ghでdiffをハイライトする
vim.keymap.set('n', 'gh', ':GitGutterLineHighlightsToggle<CR>')

-- gpでカーソル行のdiffを表示する
vim.keymap.set('n', 'gp', ':GitGutterPreviewHunk<CR>')

-- 記号の色を変更する
cmd([[highlight GitGutterAdd ctermfg=green]])
cmd([[highlight GitGutterChange ctermfg=blue]])
cmd([[highlight GitGutterDelete ctermfg=red]])

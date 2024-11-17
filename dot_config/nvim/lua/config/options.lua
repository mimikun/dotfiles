local global = require("config.global")

-- Enables mouse support. all previous modes
---@type string
vim.opt.mouse = "a"

-- Set End Of Line formats
---@type table
vim.opt.fileformats = {
    "unix",
    "dos",
    "mac",
}

-- Set file encoding list
---@type table
vim.opt.fileencodings = {
    "utf-8",
    "cp932",
    "ucs-bombs",
    "euc-jp",
    "ucs-bom",
    "default",
    "latin1",
}

-- TODO: it
-- スワップファイルを作成しないようにする
---@type boolean
vim.opt.swapfile = false

-- TODO: it
-- :q したときにバッファを消さず隠して保持しておくようにする
if global.is_unix then
    vim.opt.hidden = true
end

-- TODO: it
-- 行番号を絶対値で表示する
---@type boolean
vim.opt.number = true

-- TODO: it
-- 行番号を相対値で表示する
---@type boolean
vim.opt.relativenumber = true

-- TODO: it
-- 空白文字を可視化する
---@type boolean
vim.opt.list = true
---@type table
vim.opt.listchars = { tab = ">-", trail = "*", nbsp = "+", space = "⋅" }

-- TODO: it
-- 良い感じにインデントしてくれるようにする
---@type boolean
vim.opt.smartindent = true

-- TODO: it
-- ビープ音を画面フラッシュで代替
---@type boolean
vim.opt.visualbell = true

-- TODO: it
-- TABキーを押したときにtab文字ではなくスペースを入力するようにする
---@type boolean
vim.opt.expandtab = true

-- TODO: it
-- TABキーを押したときのインデントのスペース個数を指定する
---@type number
vim.opt.tabstop = 4

-- TODO: it
-- 自動インデントのスペース個数を指定する
---@type number
vim.opt.shiftwidth = 4

-- TODO: it
---- 検索関係の設定
-- 大文字小文字の区別をなくす
---@type boolean
vim.opt.ignorecase = true

-- TODO: it
-- 検索単語に大文字が含まれていた場合特別な意味があると解釈させる
---@type boolean
vim.opt.smartcase = true

-- TODO: it
-- 一番下の単語まで行ったら一番上に戻るようにさせる
---@type boolean
vim.opt.wrapscan = true

-- TODO: it
---- lightline.vim 用
-- 常にタブページのラベル(各タブのファイル名)を表示
---@type number
vim.opt.showtabline = 2

-- TODO: it
-- モードの表記を消す
---@type boolean
vim.opt.showmode = false

-- TODO: it
--ある行の行頭から前の行の行末に移動したり, 逆に行末から次の行の行頭に移動できるようにする
-- BackSpaceキー, SPACEキーで有効になる
-- <(←キー),>(→キー)はNORMALモード及びVISUALモードで各キーにこの機能を割り当て
-- [(←キー),](→キー)はINSERTモード(置換含む)でこの機能を有効にする
--vim.opt.whichwrap = "b", "s", "<", ">", "[", "]"
--vim.opt.whichwrap = {"b", "s", "<", ">", "[", "]"}

-- TODO: it
-- 反映時間を短くする(デフォルトは4000ms)
---@type number
vim.opt.updatetime = 250

-- editorconfig
---@type boolean
vim.g.editorconfig = true

-- TODO: it
-- シンタックスハイライトを有効にする
vim.cmd("syntax enable")

-- TODO: it
-- True Colorでのシンタックスハイライト
---@type boolean
vim.opt.termguicolors = true
vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])

-- Disable providers
---@type number
vim.g.loaded_perl_provider = 0
---@type number
vim.g.loaded_python3_provider = 0
---@type number
vim.g.loaded_ruby_provider = 0
---@type number
vim.g.loaded_node_provider = 0

-- clipboard integration
vim.opt.clipboard = "unnamedplus"
if not global.is_windows then
    vim.g.clipboard = require("config.clipboard").xsel
end

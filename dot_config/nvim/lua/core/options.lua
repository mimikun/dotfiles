local global = require("core.global")
---@type boolean
local is_unix = global.is_unix
---@type boolean
local is_windows = global.is_windows
---@type boolean
local is_linux = global.is_linux
---@type boolean
local is_human_rights = global.is_human_rights
---@type boolean
local is_wsl = global.is_wsl

-- マウス操作を有効にする
---@type string
vim.opt.mouse = "a"

-- 使用可能性のある改行コードを指定
---@type table
vim.opt.fileformats = { "unix", "dos", "mac" }

-- ファイル読み込むときのエンコード
-- 左から順に試す
---@type table
vim.opt.fileencodings = { "utf-8", "cp932", "ucs-bombs", "euc-jp" }

-- 全角文字の表示に2文字分使うようにする
---@type string
vim.opt.ambiwidth = "double"

-- スワップファイルを作成しないようにする
---@type boolean
vim.opt.swapfile = false

-- :q したときにバッファを消さず隠して保持しておくようにする
if is_unix then
    vim.opt.hidden = true
end

-- 行番号を絶対値で表示する
---@type boolean
vim.opt.number = true

-- 行番号を相対値で表示する
---@type boolean
vim.opt.relativenumber = true

-- 空白文字を可視化する
---@type boolean
vim.opt.list = true
---@type table
vim.opt.listchars = { tab = ">-", trail = "*", nbsp = "+", space = "⋅" }

-- 良い感じにインデントしてくれるようにする
---@type boolean
vim.opt.smartindent = true

-- ビープ音を画面フラッシュで代替
---@type boolean
vim.opt.visualbell = true

-- TABキーを押したときにtab文字ではなくスペースを入力するようにする
---@type boolean
vim.opt.expandtab = true

-- TABキーを押したときのインデントのスペース個数を指定する
---@type number
vim.opt.tabstop = 4

-- 自動インデントのスペース個数を指定する
---@type number
vim.opt.shiftwidth = 4

---- 検索関係の設定
-- 大文字小文字の区別をなくす
---@type boolean
vim.opt.ignorecase = true

-- 検索単語に大文字が含まれていた場合特別な意味があると解釈させる
---@type boolean
vim.opt.smartcase = true

-- 一番下の単語まで行ったら一番上に戻るようにさせる
---@type boolean
vim.opt.wrapscan = true

---- lightline.vim 用
-- 常にタブページのラベル(各タブのファイル名)を表示
---@type number
vim.opt.showtabline = 2

-- モードの表記を消す
---@type boolean
vim.opt.showmode = false

--ある行の行頭から前の行の行末に移動したり, 逆に行末から次の行の行頭に移動できるようにする
-- BackSpaceキー, SPACEキーで有効になる
-- <(←キー),>(→キー)はNORMALモード及びVISUALモードで各キーにこの機能を割り当て
-- [(←キー),](→キー)はINSERTモード(置換含む)でこの機能を有効にする
--vim.opt.whichwrap = "b", "s", "<", ">", "[", "]"
--vim.opt.whichwrap = {"b", "s", "<", ">", "[", "]"}

-- 反映時間を短くする(デフォルトは4000ms)
---@type number
vim.opt.updatetime = 250

-- ヘルプ日本語化
---@type table
vim.opt.helplang = { "ja", "en" }

-- editorconfig
---@type boolean
vim.g.editorconfig = true

-- シンタックスハイライトを有効にする
vim.cmd("syntax enable")

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
if is_wsl then
    vim.g.clipboard = {
        name = "wl-clipboard",
        copy = {
            ["+"] = { "wl-copy", "--type", "text/plain" },
            ["*"] = { "wl-copy", "--primary", "--type", "text/plain" },
        },
        paste = {
            ["+"] = { "wl-paste", "--no-newline" },
            ["*"] = { "wl-paste", "--no-newline", "--primary" },
        },
        cache_enabled = true,
    }
end

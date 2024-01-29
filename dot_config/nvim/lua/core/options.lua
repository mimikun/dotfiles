-- ref:
-- https://trap.jp/post/524/

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
vim.opt.fileformats = { "unix", "dos", "mac" }

-- ファイル読み込むときのエンコード
-- 左から順に試す
vim.opt.fileencodings = { "utf-8", "cp932", "ucs-bombs", "euc-jp" }

--" 全角文字の表示に2文字分使うようにする
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
vim.opt.tabstop = 4

-- 自動インデントのスペース個数を指定する
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
vim.opt.updatetime = 250

-- ヘルプ日本語化
vim.opt.helplang = { "ja", "en" }

-- シンタックスハイライトを有効にする
vim.cmd("syntax enable")

-- True Colorでのシンタックスハイライト
---@type boolean
vim.opt.termguicolors = true
vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])

-- Perl Providerを無効にする
vim.g.loaded_perl_provider = 0

-- Windowsでは各種プロバイダを無効にする
if is_windows then
    vim.g.loaded_python3_provider = 0
    vim.g.loaded_ruby_provider = 0
    vim.g.loaded_node_provider = 0
end

-- LinuxではPythonのパスを指定する
if is_linux then
    vim.g.python3_host_prog = "~/.local/share/mise/shims/python"
end

-- NeoVimの無名レジスタ(yでヤンクしたときにコピーする先)とOSのクリップボードを結びつける
vim.opt.clipboard = "unnamedplus"
if is_wsl then
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "win32yank -i --crlf",
            ["*"] = "win32yank -i --crlf",
        },
        paste = {
            ["+"] = "win32yank -o --lf",
            ["*"] = "win32yank -o --lf",
        },
        cache_enabled = 0,
    }
end

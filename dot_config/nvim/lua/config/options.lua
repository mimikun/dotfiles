local is_unix = require("config.global").is_unix

-- Enable mouse
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

-- 反映時間を短くする(デフォルトは4000ms)
---@type number
vim.opt.updatetime = 250

-- ヘルプ日本語化
---@type table
vim.opt.helplang = { "ja", "en" }

-- シンタックスハイライトを有効にする
vim.cmd("syntax enable")

-- True Colorでのシンタックスハイライト
---@type boolean
vim.opt.termguicolors = true

-- clipboard integration
vim.opt.clipboard = "unnamedplus"

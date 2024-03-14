if vim.loader then
    vim.loader.enable()
end

vim.cmd("filetype plugin indent off")

--- options
local uv = vim.uv and vim.uv or vim.loop

local os_name = uv.os_uname().sysname
local total_memory = uv.get_total_memory()
-- 4GB
local linux_human_rights_memory_size = 4294967296
-- 9GB
local windows_human_rights_memory_size = 9663676416

---@type boolean
local is_mac = os_name == "Darwin"

---@type boolean
local is_linux = os_name == "Linux"

---@type boolean
local is_windows = os_name == "Windows_NT"

---@type boolean
local is_wsl = vim.fn.has("wsl") == 1

---@type boolean
local is_unix = vim.fn.has("unix") == 1

local human_rights
if is_windows then
    human_rights = (total_memory > windows_human_rights_memory_size)
else
    human_rights = (total_memory > linux_human_rights_memory_size)
end

---@type boolean
local is_human_rights = human_rights

---@type string
local vim_path = vim.fn.stdpath("config")

---@type string
local path_sep = is_windows and "\\" or "/"

---@type string
local home = uv.os_homedir()

---@type string
local cache_dir = table.concat({ home, ".cache", "nvim" }, path_sep)

---@type string
local data_dir = string.format("%s/site", vim.fn.stdpath("data"))

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

--- keymaps
-- Set LEADER keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ファイル上の1行が画面上では複数行にわたっているとき
-- NORMALモード時の j/kで見た目通りに移動できるようにする
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

--- autocmds
-- Show stdpaths
vim.api.nvim_create_user_command("ShowStdPaths", function()
    print(vim.fn.stdpath("cache"))
    print(vim.fn.stdpath("config"))
    print(vim.fn.stdpath("data"))
    print(vim.fn.stdpath("state"))
end, {})

-- Toggle row number
vim.api.nvim_create_user_command("ToggleRowNumber", function()
    local number = vim.opt.number
    local number_state = number:get()
    local relativenumber = vim.opt.relativenumber
    local relativenumber_state = relativenumber:get()

    if number_state then
        number = false
        relativenumber = true
    else
        number = true
        relativenumber = false
    end
end, {})

--- Plugins: use vim-jetpack

-- Automatic installation on startup
local jetpackfile = vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim"
local jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if vim.fn.filereadable(jetpackfile) == 0 then
    vim.fn.system(string.format("curl -fsSLo %s --create-dirs %s", jetpackfile, jetpackurl))
end

-- Packer.nvim v2 style
vim.cmd("packadd vim-jetpack")
require("jetpack.packer").add({
    { "tani/vim-jetpack" },
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = ":TSUpdate",
        config = function()
            local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
            vim.opt.runtimepath:append(parser_install_dir)

            require("nvim-treesitter.configs").setup({
                parser_install_dir = parser_install_dir,
                ensure_installed = { "lua" },
                highlight = { enable = true },
                sync_install = not is_human_rights,
            })
        end,
    },
    { "projekt0n/github-nvim-theme" },
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd.colorscheme("tokyonight-storm")
        end,
    },
    { "is0n/jaq-nvim" },
})

-- Automatic plugin installation on startup
local jetpack = require("jetpack")
for _, name in ipairs(jetpack.names()) do
    if not jetpack.tap(name) then
        jetpack.sync()
        break
    end
end

vim.cmd("filetype plugin indent on")

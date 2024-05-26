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
local cache_dir = vim.fn.stdpath("cache")

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
    {
        "stevearc/oil.nvim",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "refractalize/oil-git-status.nvim" },
        },
        setup = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = function()
            local oil = require("oil")
            local oil_git_status = require("oil-git-status")

            oil.setup({
                -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
                -- Set to false if you still want to use netrw.
                default_file_explorer = true,
                -- Id is automatically added at the beginning, and name at the end
                -- See :help oil-columns
                columns = {
                    "icon",
                    -- "permissions",
                    -- "size",
                    -- "mtime",
                },
                -- Buffer-local options to use for oil buffers
                buf_options = {
                    buflisted = false,
                    bufhidden = "hide",
                },
                -- Window-local options to use for oil buffers
                win_options = {
                    wrap = false,
                    -- Use oil-git-status.nvim
                    signcolumn = "yes:2",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                    conceallevel = 3,
                    concealcursor = "nvic",
                },
                -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
                delete_to_trash = false,
                -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
                skip_confirm_for_simple_edits = false,
                -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
                -- (:help prompt_save_on_select_new_entry)
                prompt_save_on_select_new_entry = true,
                -- Oil will automatically delete hidden buffers after this delay
                -- You can set the delay to false to disable cleanup entirely
                -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
                cleanup_delay_ms = 2000,
                lsp_file_methods = {
                    -- Time to wait for LSP file operations to complete before skipping
                    timeout_ms = 1000,
                    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
                    -- Set to "unmodified" to only save unmodified buffers
                    autosave_changes = false,
                },
                -- Constrain the cursor to the editable parts of the oil buffer
                -- Set to `false` to disable, or "name" to keep it on the file names
                constrain_cursor = "editable",
                -- Set to true to watch the filesystem for changes and reload oil
                experimental_watch_for_changes = false,
                -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
                -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
                -- Additionally, if it is a string that matches "actions.<name>",
                -- it will use the mapping at require("oil.actions").<name>
                -- Set to `false` to remove a keymap
                -- See :help oil-actions for a list of all available actions
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    ["<C-s>"] = "actions.select_vsplit",
                    ["<C-h>"] = "actions.select_split",
                    ["<C-t>"] = "actions.select_tab",
                    ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",
                },
                -- Configuration for the floating keymaps help window
                keymaps_help = {
                    border = "rounded",
                },
                -- Set to false to disable all of the above keymaps
                use_default_keymaps = true,
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = false,
                    -- This function defines what is considered a "hidden" file
                    is_hidden_file = function(name, bufnr)
                        return vim.startswith(name, ".")
                    end,
                    -- This function defines what will never be shown, even when `show_hidden` is set
                    is_always_hidden = function(name, bufnr)
                        return false
                    end,
                    -- Sort file names in a more intuitive order for humans. Is less performant,
                    -- so you may want to set to false if you work with large directories.
                    natural_order = true,
                    sort = {
                        -- sort order can be "asc" or "desc"
                        -- see :help oil-columns to see which columns are sortable
                        { "type", "asc" },
                        { "name", "asc" },
                    },
                },
                -- Configuration for the floating window in oil.open_float
                float = {
                    -- Padding around the floating window
                    padding = 2,
                    max_width = 0,
                    max_height = 0,
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                    },
                    -- This is the config that will be passed to nvim_open_win.
                    -- Change values here to customize the layout
                    override = function(conf)
                        return conf
                    end,
                },
                -- Configuration for the actions floating preview window
                preview = {
                    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- min_width and max_width can be a single value or a list of mixed integer/float types.
                    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
                    max_width = 0.9,
                    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
                    min_width = { 40, 0.4 },
                    -- optionally define an integer/float for the exact width of the preview window
                    width = nil,
                    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- min_height and max_height can be a single value or a list of mixed integer/float types.
                    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
                    max_height = 0.9,
                    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
                    min_height = { 5, 0.1 },
                    -- optionally define an integer/float for the exact height of the preview window
                    height = nil,
                    border = "rounded",
                    win_options = {
                        winblend = 0,
                    },
                    -- Whether the preview window is automatically updated when the cursor is moved
                    update_on_cursor_moved = true,
                },
                -- Configuration for the floating progress window
                progress = {
                    max_width = 0.9,
                    min_width = { 40, 0.4 },
                    width = nil,
                    max_height = { 10, 0.9 },
                    min_height = { 5, 0.1 },
                    height = nil,
                    border = "rounded",
                    minimized_border = "none",
                    win_options = {
                        winblend = 0,
                    },
                },
                -- Configuration for the floating SSH window
                ssh = {
                    border = "rounded",
                },
            })
            oil_git_status.setup({})
        end,
    },
    {
        "rainbowhxch/accelerated-jk.nvim",
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
        end,
    },
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

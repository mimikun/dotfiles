-- global
if vim.loader then
    vim.loader.enable()
end

local os_name = vim.uv.os_uname().sysname

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

---@type string
local path_sep = is_windows and "\\" or "/"

-- options
vim.opt.mouse = "a"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.fileencodings = { "utf-8", "cp932", "ucs-bombs", "euc-jp" }
vim.opt.swapfile = false
vim.opt.hidden = is_unix
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "*", nbsp = "+", space = "⋅" }
vim.opt.smartindent = true
vim.opt.visualbell = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.updatetime = 250
vim.opt.helplang = { "ja", "en" }
vim.g.editorconfig = true
vim.cmd("syntax enable")
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("", "<Esc><Esc>", ":nohlsearch<CR><Esc>")

-- clipboard integration
vim.opt.clipboard = "unnamedplus"
if is_wsl then
    vim.g.clipboard = {
        name = "xsel-clipboard",
        copy = {
            ["+"] = "xsel -bi",
            ["*"] = "xsel -bi",
        },
        paste = {
            ["+"] = "xsel -bo",
            ["*"] = function()
                return vim.fn.systemlist('xsel -bo | tr -d "\r"')
            end,
        },
        cache_enabled = true,
    }
end

---@type string
local lit_path = table.concat({ vim.fn.stdpath("data"), "lit", "lit.nvim" }, path_sep)

---@type table
local litnvim_clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/neo451/lit.nvim.git",
    lit_path,
}

if not vim.uv.fs_stat(lit_path) then
    vim.system(litnvim_clone_cmd, { text = true }, function(job)
        if job.code == 0 then
            vim.notify("Installing lit.nvim...")
        end
    end)
end

vim.opt.rtp:append(lit_path)

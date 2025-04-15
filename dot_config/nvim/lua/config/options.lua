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

-- Don't use swap-file
---@type boolean
vim.opt.swapfile = false

-- When on a buffer becomes hidden when it is abandoned. (Linux only)
if global.is_unix then
    vim.opt.hidden = true
end

-- Show line number
---@type boolean
vim.opt.number = true

-- Show line number relative
---@type boolean
vim.opt.relativenumber = true

-- Make whitespace character visible
---@type boolean
vim.opt.list = true
---@type table
vim.opt.listchars = { tab = ">-", trail = "*", nbsp = "+", space = "⋅" }

-- Use smart indent
---@type boolean
vim.opt.smartindent = true

-- Use visual bell instead of beeping
---@type boolean
vim.opt.visualbell = true

-- Use the appropriate number of spaces to insert a <Tab>.
---@type boolean
vim.opt.expandtab = true

-- Set number of spaces that a <Tab> in the file counts for
---@type number
vim.opt.tabstop = 4

-- Set the number of spaces for auto-indent
---@type number
vim.opt.shiftwidth = 4

---- Configuring the search features
-- Case insensitive
---@type boolean
vim.opt.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains upper case characters
---@type boolean
vim.opt.smartcase = true

-- Searches wrap around the end of the file
---@type boolean
vim.opt.wrapscan = true

-- Remove mode show
---@type boolean
vim.opt.showmode = false

-- Shorten the updatetime (default is 4000ms)
---@type number
vim.opt.updatetime = 250

-- editorconfig
---@type boolean
vim.g.editorconfig = true

-- Enable syntax highlights
--vim.cmd("syntax enable")

-- Enables true color's syntax highlight
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

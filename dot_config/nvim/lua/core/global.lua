-- thx: https://github.com/ayamir/nvimdots/blob/main/lua/core/global.lua

local global = {}
local os_name = vim.loop.os_uname().sysname
local total_memory = vim.loop.get_total_memory()
-- 4GB
local linux_human_rights_memory_size = 4294967296
-- 9GB
local windows_human_rights_memory_size = 9663676416

function global:load_variables()
    ---@type boolean
    self.is_mac = os_name == "Darwin"

    ---@type boolean
    self.is_linux = os_name == "Linux"

    ---@type boolean
    self.is_windows = os_name == "Windows_NT"

    ---@type boolean
    self.is_wsl = vim.fn.has("wsl") == 1

    ---@type boolean
    self.is_unix = vim.fn.has("unix") == 1

    local human_rights
    if self.is_windows then
        human_rights = (total_memory > windows_human_rights_memory_size)
    else
        human_rights = (total_memory > linux_human_rights_memory_size)
    end

    ---@type boolean
    self.is_human_rights = human_rights

    ---@type string
    self.vim_path = vim.fn.stdpath("config")

    ---@type string
    self.path_sep = self.is_windows and "\\" or "/"

    local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
    self.home = home

    ---@type string
    self.cache_dir = home .. self.path_sep .. ".cache" .. self.path_sep .. "nvim" .. self.path_sep

    ---@type string
    self.plugins_dir = self.vim_path .. self.path_sep .. "plugins"

    ---@type string
    self.snippets_dir = self.vim_path .. self.path_sep .. "snippets"

    ---@type string
    self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))

    ---@type string
    self.themery_config = self.vim_path
        .. self.path_sep
        .. "lua"
        .. self.path_sep
        .. "core"
        .. self.path_sep
        .. "colorscheme.lua"
end

global:load_variables()

return global

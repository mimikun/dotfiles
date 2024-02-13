-- thx: https://github.com/ayamir/nvimdots/blob/main/lua/core/global.lua

local global = {}
local uv = vim.uv and vim.uv or vim.loop

local os_name = uv.os_uname().sysname
local total_memory = uv.get_total_memory()
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

    ---@type string
    self.home = uv.os_homedir()

    ---@type string
    self.cache_dir = table.concat({ self.home, ".cache", "nvim" }, self.path_sep)

    ---@type string
    self.plugins_dir = table.concat({ self.vim_path, "plugins" }, self.path_sep)

    ---@type string
    self.snippets_dir = table.concat({ self.vim_path, "snippets" }, self.path_sep)

    ---@type string
    self.data_dir = string.format("%s/site", vim.fn.stdpath("data"))

    ---@type string
    self.themery_config = table.concat({ self.vim_path, "lua", "core", "colorscheme.lua" }, self.path_sep)
end

global:load_variables()

return global

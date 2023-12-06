-- thx: https://github.com/ayamir/nvimdots/blob/main/lua/core/global.lua

local global = {}
local os_name = vim.loop.os_uname().sysname
local hostname = vim.loop.os_gethostname()
local total_memory = vim.loop.get_total_memory()
-- 7GB
local human_rights_memory_size = 7516192768

function global:is_human_rights()
    -- total_memory > 7GB
    return total_memory > human_rights_memory_size
end

function global:load_variables()
    self.is_mac = os_name == "Darwin"
    self.is_linux = os_name == "Linux"
    self.is_windows = os_name == "Windows_NT"
    self.is_wsl = vim.fn.has("wsl") == 1
    self.is_unix = vim.fn.has("unix") == 1
    self.is_human_rights = global:is_human_rights()
    self.vim_path = vim.fn.stdpath("config")
    self.path_sep = self.is_windows and "\\" or "/"
    local home = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")
    self.cache_dir = home .. self.path_sep .. ".cache" .. self.path_sep .. "nvim" .. self.path_sep
    self.plugins_dir = self.vim_path .. self.path_sep .. "plugins"
    self.home = home
    self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
    -- NOTE: themery file
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

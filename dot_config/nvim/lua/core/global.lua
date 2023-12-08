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
    self.is_human_rights = global:is_human_rights()

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

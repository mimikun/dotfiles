local global = {}

local os_name = vim.uv.os_uname().sysname
local total_memory = vim.uv.get_total_memory()

---@type table
local human_rights = {
    cpu = {
        "Ryzen 9 3900X",
        "i5-13500H",
    },
    memory = {
        -- 4GB
        linux = 4294967296,
        -- 9GB
        windows = 9663676416,
    },
    available_parallelism = 14,
    media_type = "SSD",
}

---@type boolean
global.is_mac = os_name == "Darwin"

---@type boolean
global.is_linux = os_name == "Linux"

---@type boolean
local is_windows = os_name == "Windows_NT"
---@type boolean
global.is_windows = is_windows

---@type boolean
global.is_wsl = vim.fn.has("wsl") == 1

---@type boolean
global.is_unix = vim.fn.has("unix") == 1

-- TODO: Replace mimikun/human_rights.nvim
local is_human_rights
if is_windows then
    is_human_rights = total_memory > human_rights.memory.windows
else
    is_human_rights = total_memory > human_rights.memory.linux
end
---@type boolean
global.is_human_rights = is_human_rights

---@type string|nil
local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
---@type string|nil
global.app_name = app_name

---@type string|string[]|nil
local vim_path = vim.fn.stdpath("config")
---@type string|string[]|nil
global.vim_path = vim_path

-- NOTE:
-- Windows: "\"
-- Linux: "/"
---@type string
local path_sep_char = string.sub(package.config, 1, 1)
-- NOTE: self.path_sep = self.is_windows and "\\" or "/"
---@type string
local path_sep = is_windows and string.rep(path_sep_char, 2) or path_sep_char
---@type string
global.path_sep = path_sep

---@type string|nil
local home = vim.uv.os_homedir()
---@type string|nil
global.home = home

---@type string|string[]|nil
global.cache_dir = vim.fn.stdpath("cache")

---@type string
global.plugins_dir = table.concat({ vim_path, "plugins" }, path_sep)

---@type string
global.snippets_dir = table.concat({ vim_path, "snippets" }, path_sep)

---@type string
global.data_dir = string.format("%s/site", vim.fn.stdpath("data"))

---@type string
global.themery_config = table.concat({ vim.fs.normalize(vim_path), "lua", "config", "themery.lua" }, path_sep)

return global

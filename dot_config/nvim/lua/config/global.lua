local global = {}

---@type string
local CONFIG_VERSION = "5.0.0"

---@type table
local stdpath = {
    config = vim.fn.stdpath("config"),
    cache = vim.fn.stdpath("cache"),
    data = vim.fn.stdpath("data"),
    state = vim.fn.stdpath("state"),
}

---@type number
local total_memory = vim.uv.get_total_memory()

---@type string
local host_name = vim.fn.hostname():lower()

---@type table
local human_rights = {
    memory = {
        -- 4GB
        linux = 4294967296,
        -- 9GB
        windows = 9663676416,
    },
}

---@type string
local os_name = vim.uv.os_uname().sysname

---@type boolean
local is_windows = os_name == "Windows_NT"

---@type string|string[]
local vim_path = stdpath.config

-- NOTE:
-- Windows: "\"
-- Linux: "/"
---@type string
local path_sep_char = string.sub(package.config, 1, 1)

-- NOTE: path_sep = is_windows and "\\" or "/"
---@type string
local path_sep = is_windows and string.rep(path_sep_char, 2) or path_sep_char

---@type string
local data_dir = string.format("%s/site", stdpath.data)

-- TODO: Replace mimikun/human_rights.nvim
---@type boolean
local is_human_rights
if is_windows then
    is_human_rights = total_memory > human_rights.memory.windows
else
    is_human_rights = total_memory > human_rights.memory.linux
end

---@type table
local home_pcs = {
    ["wakamo"] = true,
    ["izuna"] = true,
    ["azusa"] = true,
}

---@return boolean
local check_home_pc = function()
    return home_pcs[host_name] or false
end

-- XXX: fix it difficult
---@type boolean
local is_home = check_home_pc()

---@type boolean
local is_work = not is_home

global.config_version = CONFIG_VERSION
global.is_mac = os_name == "Darwin"
global.is_linux = os_name == "Linux"
global.is_windows = is_windows
global.is_wsl = vim.fn.has("wsl") == 1
global.is_unix = vim.fn.has("unix") == 1
global.is_human_rights = is_human_rights
global.host_name = host_name
global.is_home = is_home
global.is_work = is_work
global.is_azusa = host_name == "azusa"
global.app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
global.vim_path = vim_path
global.path_sep = path_sep
global.home = vim.uv.os_homedir()
global.cache_dir = stdpath.cache
global.plugins_dir = table.concat({ vim_path, "plugins" }, path_sep)
global.snippets_dir = table.concat({ vim_path, "snippets" }, path_sep)
global.data_dir = data_dir
global.friendly_snippets = table.concat({ data_dir, "lazy", "friendly-snippets" }, path_sep)
global.mason_lockfile = table.concat({ vim_path, "mason-lock.json" }, path_sep)
global.parser_install_dir = table.concat({ stdpath.data, "parser" }, path_sep)
global.scratch_buf_dir = table.concat({ stdpath.data, "scratch" }, path_sep)

return global

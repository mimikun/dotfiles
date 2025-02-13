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

---@type string
local os_name = vim.uv.os_uname().sysname

---@type boolean
local is_windows = os_name == "Windows_NT"

---@type boolean
local is_work = host_name == "tanakapc"

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

---@type string
global.config_version = CONFIG_VERSION

---@type boolean
global.is_mac = os_name == "Darwin"

---@type boolean
global.is_linux = os_name == "Linux"

---@type boolean
global.is_windows = is_windows

---@type boolean
global.is_wsl = vim.fn.has("wsl") == 1

---@type boolean
global.is_unix = vim.fn.has("unix") == 1

-- TODO: Replace mimikun/human_rights.nvim
---@type boolean
local is_human_rights
if is_windows then
    is_human_rights = total_memory > human_rights.memory.windows
else
    is_human_rights = total_memory > human_rights.memory.linux
end

---@type boolean
global.is_human_rights = is_human_rights

---@type string
global.host_name = host_name

---@type boolean
global.is_work = is_work

---@type boolean
global.is_azusa = host_name == "azusa"

---@type boolean
global.is_home = not is_work

---@type string|nil
global.app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"

---@type string|string[]
global.vim_path = vim_path

---@type string
global.path_sep = path_sep

---@type string|nil
global.home = vim.uv.os_homedir()

---@type string|string[]
global.cache_dir = stdpath.cache

---@type string
global.plugins_dir = table.concat({ vim_path, "plugins" }, path_sep)

---@type string
global.snippets_dir = table.concat({ vim_path, "snippets" }, path_sep)

---@type string
global.data_dir = data_dir

---@type string
global.friendly_snippets = table.concat({ data_dir, "lazy", "friendly-snippets" }, path_sep)

---@type string
global.mason_lockfile = table.concat({ vim_path, "mason-lock.json" }, path_sep)

---@type string
global.parser_install_dir = table.concat({ stdpath.data, "parser" }, path_sep)

---@type string
global.scratch_buf_dir = table.concat({ stdpath.data, "scratch" }, path_sep)

return global

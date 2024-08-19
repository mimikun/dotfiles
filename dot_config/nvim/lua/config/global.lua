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
global.is_windows = os_name == "Windows_NT"

---@type boolean
global.is_wsl = vim.fn.has("wsl") == 1

---@type boolean
global.is_unix = vim.fn.has("unix") == 1

-- TODO: Replace mimikun/human_rights.nvim
local is_human_rights
if global.is_windows then
    is_human_rights = total_memory > human_rights.memory.windows
else
    is_human_rights = total_memory > human_rights.memory.linux
end

---@type boolean
global.is_human_rights = is_human_rights

---@type string|nil
global.app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"

---@type string|string[]
global.vim_path = vim.fn.stdpath("config")

-- NOTE:
-- Windows: "\"
-- Linux: "/"
---@type string
local path_sep_char = string.sub(package.config, 1, 1)

-- NOTE: global.path_sep = global.is_windows and "\\" or "/"
---@type string
global.path_sep = global.is_windows and string.rep(path_sep_char, 2) or path_sep_char

---@type string|nil
global.home = vim.uv.os_homedir()

---@type string|string[]
global.cache_dir = vim.fn.stdpath("cache")

---@type string
global.plugins_dir = table.concat({ global.vim_path, "plugins" }, global.path_sep)

---@type string
global.snippets_dir = table.concat({ global.vim_path, "snippets" }, global.path_sep)

---@type string
global.data_dir = string.format("%s/site", vim.fn.stdpath("data"))

---@type string
global.friendly_snippets = table.concat({ global.data_dir, "lazy", "friendly-snippets" }, global.path_sep)

---@type string
global.mason_lockfile = table.concat({ global.vim_path, "mason-lock.json" }, global.path_sep)

---@type string
global.parser_install_dir = table.concat({ vim.fn.stdpath("data"), "parser" }, global.path_sep)

return global

local global = {}
local uv = vim.uv and vim.uv or vim.loop

local os_name = uv.os_uname().sysname
local total_memory = uv.get_total_memory()

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

    -- TODO: Replace mimikun/human_rights.nvim
    local is_human_rights
    if self.is_windows then
        is_human_rights = total_memory > human_rights.memory.windows
    else
        is_human_rights = total_memory > human_rights.memory.linux
    end

    ---@type boolean
    self.is_human_rights = is_human_rights

    ---@type string
    self.vim_path = vim.fn.stdpath("config")

    -- NOTE:
    -- Windows: "\"
    -- Linux: "/"
    ---@type string
    local path_sep_char = string.sub(package.config, 1, 1)

    -- NOTE: self.path_sep = self.is_windows and "\\" or "/"
    ---@type string
    self.path_sep = self.is_windows and string.rep(path_sep_char, 2) or path_sep_char

    ---@type string
    self.home = uv.os_homedir()

    ---@type string
    self.cache_dir = vim.fn.stdpath("cache")

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

local M = {}

---@return string
M.improved_encoding = function()
    local encoding = vim.opt.fileencoding:get()
    if encoding == "utf-8" then
        encoding = "UTF-8"
    elseif encoding == "cp932" then
        encoding = "SHIFT-JIS"
    elseif encoding == "euc-jp" then
        encoding = "EUC-JP"
    else
        encoding = encoding
    end
    return encoding
end

---@type table
M.diff = {
    "diff",
    symbols = {
        added = " ",
        modified = " ",
        removed = " ",
    },
    source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end,
}

---@type table
M.lazydo = {
    function()
        local status, result = pcall(require, "lazydo")
        if not status then
            return nil
        end
        return pcall(result.get_lualine_stats)
    end,
    cond = function()
        local status, lazydo = pcall(require, "lazydo")
        return status and lazydo._initialized or false
    end,
}

---@type table
M.filename = {
    "filename",
    newfile_status = true,
    path = 1,
    shorting_target = 24,
    symbols = {
        modified = "_󰷥",
        readonly = " ",
        newfile = "󰄛",
    },
}

---@type table
M.diagnostics = {
    "diagnostics",
    sources = {
        "nvim_diagnostic",
        "nvim_lsp",
    },
    sections = {
        "error",
        "warn",
        "info",
        "hint",
    },
    symbols = {
        error = " ",
        warn = " ",
        info = " ",
        hint = "",
    },
}

---@type table
M.copilot = {
    "copilot",
    symbols = {
        status = {
            icons = {
                enabled = " ",
                sleep = " ",
                disabled = " ",
                warning = " ",
                unknown = " ",
            },
            hl = {
                enabled = "#50FA7B",
                sleep = "#AEB7D0",
                disabled = "#6272A4",
                warning = "#FFB86C",
                unknown = "#FF5555",
            },
        },
        spinners = "dots",
        spinner_color = "#6272A4",
    },
    show_colors = true,
    show_loading = true,
}

---@type table
M.aerial = {
    "aerial",
    sep = " ) ",
    depth = nil,
    dense = false,
    dense_sep = ".",
    colored = true,
}

---@type table
M.fileformat = {
    "fileformat",
    icons_enabled = true,
    symbols = {
        unix = "LF",
        dos = "CRLF",
        mac = "CR",
    },
    separator = {
        left = "",
        right = "",
    },
}

---@type table
M.buffers = {
    "buffers",
    symbols = {
        modified = "_󰷥",
        alternate_file = " ",
        directory = " ",
    },
}

---

---@type table
M.weather_or_nothing = {}

---@type table
M.mcphub_or_nothing = {}

---@return string|nil
M.eskk_mode = function()
    if vim.fn["eskk#is_enabled"]() then
        ---@type string
        local get_mode = vim.fn["eskk#get_mode"]()
        return get_mode
    end
end

---@return string
M.special_notice = function()
    local special_msg = "コロナを忘れるな！"
    return special_msg
end

---@type table
M.obsidian = {
    "g:obsidian",
}

return M

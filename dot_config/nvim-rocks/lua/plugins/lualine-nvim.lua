---@type table
local components = {
    ---@return string
    improved_encoding = function()
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
    end,
    ---@return table|nil
    diff_source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end,
    ---@return string|nil
    eskk_mode = function()
        if vim.fn["eskk#is_enabled"]() then
            ---@type string
            local get_mode = vim.fn["eskk#get_mode"]()
            return get_mode
        end
    end,
    ---@return string
    special_notice = function()
        local special_msg = "コロナを忘れるな！"
        return special_msg
    end,
}

---@type table
local disabled_filetypes = {
    statusline = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
    winbar = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
}

---@type table
local options = {
    theme = "auto",
    icons_enabled = true,
    globalstatus = true,
    disabled_filetypes = disabled_filetypes,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
}

---@type table
local sections = {
    lualine_a = { "mode" },
    lualine_b = {
        {
            "filename",
            newfile_status = true,
            path = 1,
            shorting_target = 24,
            symbols = {
                modified = "_󰷥",
                readonly = " ",
                newfile = "󰄛",
            },
        },
    },
    lualine_c = {
        {
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
        },
        { "navic" },
    },
    lualine_x = {
        components.improved_encoding,
        {
            "diff",
            symbols = {
                added = " ",
                modified = " ",
                removed = " ",
            },
            source = components.diff_source,
        },
    },
    lualine_y = { "filetype" },
    lualine_z = {
        {
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
        },
    },
}

---@type table
local opts = {
    options = options,
    sections = sections,
    tabline = {},
    winbar = {},
}

require("lualine").setup(opts)

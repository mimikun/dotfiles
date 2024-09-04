local component = require("plugins.configs.lualine-nvim.components")

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
        component.improved_encoding,
        {
            "diff",
            symbols = {
                added = " ",
                modified = " ",
                removed = " ",
            },
            source = component.diff_source,
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

return sections

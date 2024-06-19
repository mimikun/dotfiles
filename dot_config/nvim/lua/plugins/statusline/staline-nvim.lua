---@type table
local events = { "BufReadPre", "BufNewFile" }

---status line: staline
---@type table
local staline_opts = {
    defaults = {
        expand_null_ls = false,
        -- TODO: Use utils/icons.lua
        left_separator = "",
        -- TODO: Use utils/icons.lua
        right_separator = "",
        full_path = false,
        -- TODO: Use utils/icons.lua
        line_column = "[%l/%L] :%c 並%p%% ",
        fg = "#000000",
        bg = "none",
        inactive_color = "#303030",
        inactive_bgcolor = "none",
        -- true lsp colors.
        true_colors = false,
        -- TODO: Use utils/icons.lua
        font_active = "none",
        -- TODO: Use utils/icons.lua
        mod_symbol = "  ",
        -- TODO: Use utils/icons.lua
        lsp_client_symbol = " ",
        lsp_client_character_length = 12,
        -- TODO: Use utils/icons.lua
        branch_symbol = " ",
        -- TODO: Use utils/icons.lua
        cool_symbol = " ",
        null_ls_symbol = "",
    },
    mode_colors = {
        n = "#2bbb4f",
        i = "#986fec",
        c = "#e27d60",
        v = "#4799eb",
    },
    mode_icons = {
        -- TODO: Use utils/icons.lua
        n = " ",
        -- TODO: Use utils/icons.lua
        i = " ",
        -- TODO: Use utils/icons.lua
        c = " ",
        -- TODO: Use utils/icons.lua
        v = " ",
    },
    sections = {
        left = { "- ", "-mode", "left_sep_double", " ", "branch" },
        mid = { "file_name" },
        right = { "cool_symbol", "right_sep_double", "-line_column" },
    },
    inactive_sections = {
        left = { "branch" },
        mid = { "file_name" },
        right = { "line_column" },
    },
    special_table = {
        -- TODO: Use utils/icons.lua
        NvimTree = { "NvimTree", " " },
    },
    lsp_symbols = {
        -- TODO: Use utils/icons.lua
        Error = " ",
        -- TODO: Use utils/icons.lua
        Info = " ",
        -- TODO: Use utils/icons.lua
        Warn = " ",
        -- TODO: Use utils/icons.lua
        Hint = "",
    },
}

---buffer line: stabline
---@type table
local stabline_opts = {
    style = "bar",
    -- TODO: Use utils/icons.lua
    stab_left = "┃",
    stab_right = " ",
    inactive_bg = "#1e2127",
    inactive_fg = "#aaaaaa",
    font_active = "bold",
    exclude_fts = { "NvimTree", "dashboard", "lir" },
    stab_start = "",
    stab_end = "",
    numbers = function(bufn, n)
        return "*" .. n .. " "
    end,
}

---@type LazySpec
local spec = {
    "tamton-aquib/staline.nvim",
    --lazy = false,
    event = events,
    init = function()
        vim.opt.laststatus = 2
        vim.opt.showtabline = 2
        vim.opt.termguicolors = true
    end,
    config = function()
        require("staline").setup(staline_opts)
        require("stabline").setup(stabline_opts)
    end,
    cond = false,
}

return spec

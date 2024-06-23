---@type table
local opts = {
    contrast = {
        terminal = false,
        sidebars = false,
        floating_windows = false,
        cursor_line = false,
        lsp_virtual_text = false,
        non_current_windows = false,
        filetypes = {},
    },

    styles = {
        comments = {},
        strings = {},
        keywords = {},
        functions = {},
        variables = {},
        operators = {},
        types = {},
    },

    plugins = {
        "dap",
        "dashboard",
        "fidget",
        "gitsigns",
        "hop",
        "indent-blankline",
        "lspsaga",
        "neogit",
        "noice",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
        "trouble",
        "which-key",
        "nvim-notify",
    },

    disable = {
        colored_cursor = false,
        borders = false,
        background = vim.g.transparent_enabled,
        term_colors = false,
        eob_lines = false,
    },

    high_visibility = {
        lighter = false,
        darker = false,
    },

    lualine_style = "default",
    async_loading = true,
}

---@type LazySpec
local spec = {
    "marko-cerovac/material.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec

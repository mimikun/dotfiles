-- NOTE: Not support "transparent = true"
---@type table
local opts = {
    -- enable terminal colors
    terminal_colors = true,
    -- You can pass the style using the format: style = true
    styles = {
        -- style for comments
        comments = { italic = true },
        -- style for keywords
        keywords = {},
        -- style for identifiers
        identifiers = {},
        -- style for functions
        functions = { italic = true },
        -- style for variables
        variables = {},
        -- style for booleans
        booleans = {},
    },
    -- You can disable/enable integrations
    integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        hop = false,
        indent_blankline = true,
        lazy = true,
        lsp = true,
        markdown = true,
        mason = true,
        navic = false,
        neo_tree = false,
        noice = true,
        notify = true,
        rainbow_delimiters = true,
        telescope = true,
        treesitter = true,
    },
}

---@type LazySpec
local spec = {
    "dgox16/oldworld.nvim",
    --lazy = false,
    opts = opts,
    priority = 1000,
    --cond = false,
}

return spec

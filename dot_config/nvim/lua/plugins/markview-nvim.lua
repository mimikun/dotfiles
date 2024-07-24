---@type table
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    buf_ignore = { "nofile" },
    modes = { "n", "no" },

    options = {
        on_enable = {},
        on_disable = {},
    },

    block_quotes = {},
    checkboxes = {},
    code_blocks = {},
    headings = {},
    horizontal_rules = {},
    inline_codes = {},
    links = {},
    list_items = {},
    tables = {},
}

---@type LazySpec
local spec = {
    "OXY2DEV/markview.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = "Markview",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec

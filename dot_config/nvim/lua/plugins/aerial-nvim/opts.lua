---@type table
local opts = {
    backends = {
        "treesitter",
        "lsp",
        "markdown",
        "asciidoc",
        "man",
    },
    layout = {
        win_opts = {},
    },
    ignore = {
        filetypes = {},
    },
    guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
    },
    float = {
        border = "rounded",
        relative = "cursor",
    },
    nav = {
        border = "rounded",
    },
}

return opts

---@type table
local blank = {
    enable = false,
    style = {
        { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
    },
    notify = false,
    priority = 9,
    exclude_filetypes = {
        aerial = true,
        dashboard = true,
    },
    -- unique options
    chars = { "․" },
}

return blank

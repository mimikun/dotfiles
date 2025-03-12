---@type table[]
local custom_items = {
    {
        order = 1,
        name = "Code Action",
        not_ft = {
            "markdown",
            "toggleterm",
            "json",
            "http",
        },
        action = function(_)
            vim.lsp.buf.code_action()
        end,
    },
}

return custom_items

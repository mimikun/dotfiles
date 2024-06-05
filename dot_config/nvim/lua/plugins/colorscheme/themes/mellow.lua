---@type LazySpec
local spec = {
    "mellow-theme/mellow.nvim",
    --lazy = false,
    init = function()
        vim.g.mellow_italic_comments = true
        vim.g.mellow_italic_keywords = false
        vim.g.mellow_italic_booleans = false
        vim.g.mellow_italic_functions = false
        vim.g.mellow_italic_variables = false
        vim.g.mellow_bold_comments = false
        vim.g.mellow_bold_keywords = false
        vim.g.mellow_bold_booleans = false
        vim.g.mellow_bold_functions = false
        vim.g.mellow_bold_variables = false
        vim.g.mellow_transparent = vim.g.transparent_enabled
    end,
    --cond = false,
}

return spec

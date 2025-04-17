---@type LazySpec
local spec = {
    "sho-87/kanagawa-paper.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        gutter = false,
        -- disabled when transparent
        dimInactive = true,
        functionStyle = { italic = false },
        keywordStyle = { italic = false, bold = false },
        statementStyle = { italic = false, bold = false },
        typeStyle = { italic = false },
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec

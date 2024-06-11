local spec = {
    "uga-rosa/ccc.nvim",
    --lazy = false,
    event = "BufRead",
    opts = {
        highlighter = {
            auto_enable = true,
            lsp = true,
        },
    },
    --cond = false,
}

return spec

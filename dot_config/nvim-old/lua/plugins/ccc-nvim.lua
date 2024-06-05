local spec = {
    "uga-rosa/ccc.nvim",
    --lazy = false,
    event = "BufRead",
    -- https://github.com/uga-rosa/ccc.nvim/issues/104
    --commit = "392ef0640b96684e88b3965f32f3bc42530f66c3",
    opts = {
        highlighter = {
            auto_enable = true,
            lsp = true,
        },
    },
    --cond = false,
}

return spec

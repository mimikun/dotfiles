return {
    "uga-rosa/ccc.nvim",
    --lazy = false,
    event = "BufRead",
    config = function()
        local ccc = require("ccc")
        ccc.setup({
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
        })
    end,
    --cond = false,
}

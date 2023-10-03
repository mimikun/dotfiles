return {
    "poljar/typos.nvim",
    --lazy = false,
    event = "BufRead",
    config = function()
        require("typos").setup({})
    end,
    --cond = false,
}

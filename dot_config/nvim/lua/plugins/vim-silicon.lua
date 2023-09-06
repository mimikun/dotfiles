return {
    "segeljakt/vim-silicon",
    --lazy = false,
    --event = "VeryLazy",
    cmd = {
        "Silicon",
    },
    config = function()
        vim.g.silicon["theme"] = "GitHub"
        --vim.g.silicon["font"] = "Hack"
        --vim.g.silicon["output"] = "~/images/silicon-{time:%Y-%m-%d-%H%M%S}.png"
    end,
    cond = false,
}

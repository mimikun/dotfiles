return {
    {
        "lambdalisue/kensaku.vim",
        --lazy = false,
        --event = "VeryLazy",
        dependencies = {
            "vim-denops/denops.vim",
        },
        --cond = false,
    },
    {
        "lambdalisue/kensaku-command.vim",
        --lazy = false,
        --event = "VeryLazy",
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        --cond = false,
    },
    {
        "lambdalisue/kensaku-search.vim",
        --lazy = false,
        --event = "VeryLazy",
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        --cond = false,
    },
}

return {
    {
        "lambdalisue/kensaku.vim",
        dependencies = {
            "vim-denops/denops.vim",
        },
        --cond = false,
    },
    {
        "lambdalisue/kensaku-command.vim",
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        --cond = false,
    },
    {
        "lambdalisue/kensaku-search.vim",
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        --cond = false,
    },
}

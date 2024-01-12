-- Disable if there are no human rights
local cond = require("core.global").is_human_rights

return {
    {
        "lambdalisue/kensaku.vim",
        --lazy = false,
        --event = "VeryLazy",
        dependencies = {
            "vim-denops/denops.vim",
        },
        cond = cond,
    },
    {
        "lambdalisue/kensaku-command.vim",
        --lazy = false,
        --event = "VeryLazy",
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        cond = cond,
    },
    {
        "lambdalisue/kensaku-search.vim",
        --lazy = false,
        --event = "VeryLazy",
        dependencies = {
            "lambdalisue/kensaku.vim",
        },
        cond = cond,
    },
}

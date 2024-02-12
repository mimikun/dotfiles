local global = require("core.global")
local is_human_rights = global.is_human_rights

return {
    "lambdalisue/kensaku-command.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Kensaku",
    dependencies = {
        "vim-denops/denops.vim",
        "lambdalisue/kensaku.vim",
    },
    config = true,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

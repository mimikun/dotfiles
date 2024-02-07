local global = require("core.global")
local is_human_rights = global.is_human_rights

return {
    "lambdalisue/gin.vim",
    --lazy = false,
    --event = "VeryLazy",
    dependencies = {
        "vim-denops/denops.vim",
    },
    -- Disable if there are no human rights
    --cond = is_human_rights,
    cond = false,
}

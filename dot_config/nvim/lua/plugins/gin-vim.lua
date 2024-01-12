-- Disable if there are no human rights
local cond = require("core.global").is_human_rights

return {
    "lambdalisue/gin.vim",
    --lazy = false,
    --event = "VeryLazy",
    dependencies = {
        "vim-denops/denops.vim",
    },
    cond = false,
}

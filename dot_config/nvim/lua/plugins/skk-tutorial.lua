local global = require("core.global")
local is_human_rights = global.is_human_rights

return {
    "willelz/skk-tutorial.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "SKKTutorialStart",
    dependencies = {
        "vim-denops/denops.vim",
        "vim-skk/skkeleton",
    },
    -- Disable if there are no human rights
    --cond = is_human_rights,
    cond = false,
}

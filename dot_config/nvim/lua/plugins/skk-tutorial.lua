-- Invalidate if there are no human rights
local cond = require("core.global").is_human_rights

return {
    "willelz/skk-tutorial.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "SKKTutorialStart",
    dependencies = {
        "vim-denops/denops.vim",
        "vim-skk/skkeleton",
    },
    cond = cond,
}

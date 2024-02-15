local global = require("core.global")
local is_human_rights = global.is_human_rights

return {
    "Omochice/dps-translate-vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Translate",
    dependencies = {
        "vim-denops/denops.vim",
    },
    config = function()
        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

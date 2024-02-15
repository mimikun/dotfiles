local global = require("core.global")
local is_human_rights = global.is_human_rights

return {
    "Omochice/dps-translate-vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Translate",
    dependencies = {
        "vim-denops/denops.vim",
        "yuki-yano/denops-lazy.nvim",
    },
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("dps-translate-vim")

        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

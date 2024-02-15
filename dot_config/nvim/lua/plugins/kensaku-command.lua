local global = require("core.global")
local is_human_rights = global.is_human_rights

return {
    "lambdalisue/kensaku-command.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Kensaku",
    dependencies = {
        "vim-denops/denops.vim",
        "yuki-yano/denops-lazy.nvim",
        "lambdalisue/kensaku.vim",
    },
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("kensaku-command.vim")
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

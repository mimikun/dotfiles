local global = require("core.global")
local is_human_rights = global.is_human_rights

local keymaps = {
    { "<CR>", desc = "kensaku-search-replace" },
}

return {
    "lambdalisue/kensaku-search.vim",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    dependencies = {
        "vim-denops/denops.vim",
        "yuki-yano/denops-lazy.nvim",
        "lambdalisue/kensaku.vim",
    },
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("kensaku-search.vim")

        vim.set.keymap("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { noremap = true })
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

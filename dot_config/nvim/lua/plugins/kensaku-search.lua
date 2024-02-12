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
        "lambdalisue/kensaku.vim",
    },
    config = function()
        vim.set.keymap("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { noremap = true })
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

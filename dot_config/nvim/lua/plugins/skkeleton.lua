local global = require("core.global")
local is_human_rights = global.is_human_rights

local keymaps = {
    { "<C-j>", desc = "Toggle Kana-mode skkeleton" },
}

return {
    "vim-skk/skkeleton",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    dependencies = {
        "vim-denops/denops.vim",
    },
    config = function()
        -- TODO: setting
        -- https://github.com/vim-skk/skkeleton/blob/main/doc/skkeleton.jax
    end,
    -- Disable if there are no human rights
    --cond = is_human_rights,
    cond = false,
}
